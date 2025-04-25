import 'package:dio/dio.dart';

String apiErrorHandler(dynamic e) {
  try {
    if (e is DioException) {
      final res = e.response;
      if (res == null) return "Network Error.";
      if (res.data is Map<String, dynamic>) return res.data['error'];
      return "${res.statusCode} ${res.statusMessage}!";
    } else {
      return e.toString();
    }
  } catch (e) {
    return 'Something went wrong. Please try again later.';
  }
}
