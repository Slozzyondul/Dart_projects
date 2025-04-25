import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/core/models/product.model.dart';
import 'package:flutter_starter/core/services/base.service.dart';
import 'package:flutter_starter/core/constants/apis.constant.dart';

class ProductService {
  final _dio = locator<BaseService>().dio;

  Future<List<Product>> getProducts() async {
    final response = await _dio.get(apiProductsGet);
    if (response.data.isEmpty) return [];
    return [...response.data.map((json) => Product.fromJson(json))];
  }

  Future<Product> addProduct(Map<String, dynamic> payload) async {
    final response = await _dio.post(apiAddProduct, data: payload);
    return Product.fromJson(response.data);
  }

  Future<Product> updateProduct(Map<String, dynamic> payload) async {
    final response = await _dio.put(apiUpdateProduct, data: payload);
    return Product.fromJson(response.data);
  }
}
