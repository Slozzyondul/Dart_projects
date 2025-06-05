import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('getProductsList returns a global list of products', () {
    final productsRepository = FakeProductsRepository();
    final productsList = productsRepository.getProductsList();
    expect(productsList, kTestProducts);
  });

  //retun non null product matching id
  test('getProduct(1) returns a product matching id 1', () {
    final productsRepository = FakeProductsRepository();
    final product = productsRepository.getProduct('1');
    expect(product, kTestProducts[0]);
  });
}
