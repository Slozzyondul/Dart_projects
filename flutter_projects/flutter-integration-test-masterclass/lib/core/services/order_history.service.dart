import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/core/services/base.service.dart';
import 'package:flutter_starter/core/constants/apis.constant.dart';
import 'package:flutter_starter/core/models/order_history.model.dart';

class OrderHistoryService {
  final _dio = locator<BaseService>().dio;

  Future<List<OrderHistory>?> getOrderHistory() async {
    final response = await _dio.get(apiOrderHistoryGet);
    if (response.data == null) return [];
    return [...response.data.map((json) => OrderHistory.fromJson(json as Map<String, dynamic>))];
  }
}
