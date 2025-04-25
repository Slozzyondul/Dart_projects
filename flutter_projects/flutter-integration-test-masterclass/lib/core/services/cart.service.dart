import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/core/models/cart.model.dart';
import 'package:flutter_starter/core/services/base.service.dart';
import 'package:flutter_starter/core/constants/apis.constant.dart';

class CartService {
  final _dio = locator<BaseService>().dio;

  Future<Cart?> getCart() async {
    final response = await _dio.get(apiCartGet);
    if ((response.data as Map).isEmpty) return null;
    return Cart.fromJson(response.data);
  }

  Future<Cart?> updateCart({required int productId, required double quantity}) async {
    final response = await _dio.put(apiCartUpdate, data: {"product_id": productId, "quantity": quantity});
    if ((response.data as Map).isEmpty) return null;
    return Cart.fromJson(response.data);
  }

  Future<bool> placeOrder() async {
    final response = await _dio.put(apiCartPlaceOrder);
    final orderPlaced = response.data as bool;
    return orderPlaced;
  }
}
