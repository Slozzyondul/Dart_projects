import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/fake_products_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FakeProductsRepository makeProductsRepository() =>
      FakeProductsRepository(addDelay: false);
  group('FakeProductsRepository', () {
    test('getProductsList returns a global list of products', () {
      final productsRepository = makeProductsRepository();
      final productsList = productsRepository.getProductsList();
      expect(productsList, kTestProducts);
    });

    //retun non null product matching id
    test('getProduct(1) returns a product matching id 1', () {
      final productsRepository = makeProductsRepository();
      final product = productsRepository.getProduct('1');
      expect(product, kTestProducts[0]);
    });

    // return a null test an id that is not in the product list
    test('getProduct(99) returns null', () {
      final productsRepository = makeProductsRepository();
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
    final productsRepository = makeProductsRepository();
    expect(
      await productsRepository.fetchProductsList(),
      kTestProducts,
    );
  });

  test('watchProductsList emits global list', () {
    final productsRepository = makeProductsRepository();
    expect(
      productsRepository.watchProductsList(),
      emits(kTestProducts),
    );
  });

  test('watchProduct(1) emits the first product', () {
    final productsRepository = makeProductsRepository();
    expect(
      productsRepository.watchProduct('1'),
      emits(kTestProducts[0]),
    );
  });

  test('watchProduct(99) emits null', () {
    final productsRepository = makeProductsRepository();
    expect(
      productsRepository.watchProduct('99'),
      emits(null),
    );
  });
}
