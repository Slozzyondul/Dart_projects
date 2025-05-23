// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_reviews_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$reviewsRepositoryHash() => r'9dc2728f1e3e032e3b65047f12f368207fd91ddd';

/// See also [reviewsRepository].
@ProviderFor(reviewsRepository)
final reviewsRepositoryProvider = Provider<FakeReviewsRepository>.internal(
  reviewsRepository,
  name: r'reviewsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$reviewsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ReviewsRepositoryRef = ProviderRef<FakeReviewsRepository>;
String _$productReviewsHash() => r'7fafee2f2b462fbd7617166d5d8b9e44f4106551';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [productReviews].
@ProviderFor(productReviews)
const productReviewsProvider = ProductReviewsFamily();

/// See also [productReviews].
class ProductReviewsFamily extends Family<AsyncValue<List<Review>>> {
  /// See also [productReviews].
  const ProductReviewsFamily();

  /// See also [productReviews].
  ProductReviewsProvider call(
    String productId,
  ) {
    return ProductReviewsProvider(
      productId,
    );
  }

  @override
  ProductReviewsProvider getProviderOverride(
    covariant ProductReviewsProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productReviewsProvider';
}

/// See also [productReviews].
class ProductReviewsProvider extends AutoDisposeStreamProvider<List<Review>> {
  /// See also [productReviews].
  ProductReviewsProvider(
    String productId,
  ) : this._internal(
          (ref) => productReviews(
            ref as ProductReviewsRef,
            productId,
          ),
          from: productReviewsProvider,
          name: r'productReviewsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productReviewsHash,
          dependencies: ProductReviewsFamily._dependencies,
          allTransitiveDependencies:
              ProductReviewsFamily._allTransitiveDependencies,
          productId: productId,
        );

  ProductReviewsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  Override overrideWith(
    Stream<List<Review>> Function(ProductReviewsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductReviewsProvider._internal(
        (ref) => create(ref as ProductReviewsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Review>> createElement() {
    return _ProductReviewsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductReviewsProvider && other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductReviewsRef on AutoDisposeStreamProviderRef<List<Review>> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _ProductReviewsProviderElement
    extends AutoDisposeStreamProviderElement<List<Review>>
    with ProductReviewsRef {
  _ProductReviewsProviderElement(super.provider);

  @override
  String get productId => (origin as ProductReviewsProvider).productId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
