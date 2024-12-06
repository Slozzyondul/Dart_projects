// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, body_might_complete_normally_nullable

import 'package:dio/dio.dart';
import '../models/app_config.dart';
import 'package:get_it/get_it.dart';

class HTTPService {
  final Dio dio = Dio();

  AppConfig? _appConfig;
  String? _base_url;

  HTTPService() {
    _appConfig = GetIt.instance.get<AppConfig>();
    _base_url = _appConfig!.COIN_API_BASE_URL;
    //print(_base_url);
  }

  Future<Response?> get(String _path) async {
    try {
      String _url = "$_base_url$_path";
      //dio.get("", queryParameters: {"id": 1},);
      //print(_url);
      Response _response = await dio.get(_url);
      //print(_response);
      return _response;
    } catch (e) {
      print('HTTPService: unable to complete the get request');
      print(e);
    }
  }
}