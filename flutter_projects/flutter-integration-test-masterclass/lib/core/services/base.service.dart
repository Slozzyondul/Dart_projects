import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/app_config.dart';
import 'package:flutter_starter/core/services/auth.service.dart';
import 'package:flutter_starter/core/constants/apis.constant.dart';
import 'package:flutter_starter/core/services/secure_storage.service.dart';

class BaseService {
  final storageService = locator<SecureStorageService>();
  static final baseOptions = BaseOptions(baseUrl: AppConfig.baseUrl, contentType: 'application/json');

  final dio = Dio(baseOptions);

  BaseService() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequest,
        onError: (error, handler) => handler.next(error),
        onResponse: (response, handler) => handler.next(response),
      ),
    );
  }

  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final auth = await storageService.getAuthData();
    if (auth.accessToken != null) {
      String token = auth.accessToken!;
      final authService = locator<AuthService>();
      if (Jwt.isExpired(token)) {
        try {
          final response = await Dio(baseOptions).get(
            apiRenewToken,
            options: Options(headers: {"Authorization": "Bearer $token"}),
          );
          token = response.data;
          await storageService.updateAccessToken(token);
        } catch (e) {
          authService.logout();
          return handler.next(options);
        }
      }
      options.headers['Authorization'] = "Bearer $token";
    }
    return handler.next(options);
  }
}
