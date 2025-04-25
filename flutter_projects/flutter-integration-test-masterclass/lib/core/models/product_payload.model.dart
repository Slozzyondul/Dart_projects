import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_payload.model.g.dart';
part 'product_payload.model.freezed.dart';

@Freezed(toJson: true)
class ProductPayload with _$ProductPayload {
  factory ProductPayload({
    required int? id,
    required String? name,
    required double? price,
  }) = _ProductPayload;
}
