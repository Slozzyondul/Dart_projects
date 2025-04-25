import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_starter/core/models/auth.model.dart';

final accessToken = "access_token";
final refreshToken = "refresh_token";

class SecureStorageService {
  final _storage = FlutterSecureStorage(
    iOptions: _getIOSOptions(),
    aOptions: _getAndroidOptions(),
  );

  static IOSOptions _getIOSOptions() => const IOSOptions();

  static AndroidOptions _getAndroidOptions() => const AndroidOptions(
        resetOnError: true,
        encryptedSharedPreferences: true,
      );

  Future<void> storeAuthData(Auth auth) async {
    await _storage.write(key: accessToken, value: auth.accessToken);
    await _storage.write(key: refreshToken, value: auth.refreshToken);
  }

  Future<Auth> getAuthData() async {
    final map = await _storage.readAll();
    return Auth(accessToken: map[accessToken], refreshToken: map[refreshToken]);
  }

  Future<void> updateAccessToken(String token) async {
    await _storage.write(key: accessToken, value: token);
  }

  Future<void> clearAuthData() async {
    await _storage.deleteAll();
  }
}
