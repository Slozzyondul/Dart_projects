import 'package:ecommerce_app/src/features/products/data/products_repository.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/products_admin/application/image_upload_service.dart';
import 'package:ecommerce_app/src/routing/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'admin_product_edit_controller.g.dart';

@riverpod
class AdminProductEditController extends _$AdminProductEditController {
  @override
  FutureOr<void> build() {}

  Future<bool> updateProduct({
    required Product product,
    required String title,
    required String description,
    required String price,
    required String availableQuantity,
  }) async {
    final productsRepository = ref.read(productsRepositoryProvider);
    //convert from string to double to avoid type error
    final priceValue = double.parse(price);
    final availableQuantityValue = int.parse(availableQuantity);

    // update product meta data to keep the pre-existing id and imageUrl
    final updatedProduct = product.copyWith(
      title: title,
      description: description,
      price: priceValue,
      availableQuantity: availableQuantityValue,
    );
    // Pass the id from the original product and the updatedProduct
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => productsRepository.updateProduct(product.id, updatedProduct));
    final success = state.hasError == false;

    if (success) {
      // when successful sent back to the previous screen
      ref.read(goRouterProvider).pop();
    }
    return success;
  }

  Future<void> deleteProduct(Product product) async {
    final imageUploadService = ref.read(imageUploadServiceProvider);
     state = const AsyncLoading();
    final value = await AsyncValue.guard(
        () => imageUploadService.deleteProduct(product));
    final success = value.hasError == false;

    if (success) {
      // when successful sent back to the previous screen
      ref.read(goRouterProvider).pop();
    }
  }


}
