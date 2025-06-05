import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('FakeProductsRepository', () {
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

    // return a null test an id that is not in the product list
    test('getProduct(99) returns null', () {
      final productsRepository = FakeProductsRepository();
      final product = productsRepository.getProduct('99');
      expect(
        product,
        null,
        reason:
            'getProduct(99) should return null because the id is not in the list',
      );
    });
  });

  test('fetchProductsList returns a global list of products', () async {
    final productsRepository = FakeProductsRepository();
    expect(
      await productsRepository.fetchProductsList(),
      kTestProducts,
    );
  });

  test('watchProductsList emits global list', () {
    final productsRepository = FakeProductsRepository();
    expect(
      productsRepository.watchProductsList(),
      emits(kTestProducts),
    );
  });
}
