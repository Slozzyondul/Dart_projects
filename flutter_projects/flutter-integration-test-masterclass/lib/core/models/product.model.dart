import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.model.g.dart';
part 'product.model.freezed.dart';

@Freezed(toJson: false)
class Product with _$Product {
  factory Product({
    required int id,
    required String name,
    required double price,
    @JsonKey(name: 'seller_id') required int sellerId,
    @JsonKey(name: 'seller_name') required String sellerName,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
