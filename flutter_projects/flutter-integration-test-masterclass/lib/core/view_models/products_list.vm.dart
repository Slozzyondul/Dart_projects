import 'package:flutter_starter/locator.dart';
import 'package:flutter_starter/core/view_models/base.vm.dart';
import 'package:flutter_starter/core/models/product.model.dart';
import 'package:flutter_starter/core/services/products.service.dart';

class ProductsListViewModel extends BaseViewModel {
  List<Product> products = [];
  final _productService = locator<ProductService>();

  Future<void> getProducts() async {
    try {
      setIsLoading(true);
      products = await _productService.getProducts();
    } catch (error) {
      displayApiError(error);
    } finally {
      setIsLoading(false);
    }
  }

  void addProduct(Product newProduct) {
    products.add(newProduct);
    notifyListeners();
  }

  void updateProduct(Product updatedProduct) {
    final index = products.indexWhere((p) => p.id == updatedProduct.id);
    products[index] = updatedProduct;
    notifyListeners();
  }
}
