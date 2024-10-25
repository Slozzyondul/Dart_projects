import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:ecommerce_app/src/features/products_admin/data/image_upload_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_product_upload_controller.g.dart';

@riverpod
class AdminProductUploadController extends _$AdminProductUploadController {
  @override
  FutureOr<void> build() {}

  Future<void> upload(Product product) async {
    try {
      state = const AsyncLoading();

      final downloadUrl = await ref
          .read(imageUploadRepositoryProvider)
          .uploadProductImageFromAsset(
            product.imageUrl,
            product.id,
          );
          // TODO: save downloadUrl to firestore 
      state = const AsyncData(null);
      // TODO: on succes move to the edit product page
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
