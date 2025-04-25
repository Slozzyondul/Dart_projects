import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_starter/core/models/product.model.dart';

part 'cart.model.g.dart';
part 'cart.model.freezed.dart';

@Freezed(toJson: false)
class Cart with _$Cart {
  factory Cart({
    required int id,
    required List<CartItem> items,
    @JsonKey(name: 'buyer_id') required int buyerId,
    @JsonKey(name: 'buyer_name') required String buyerName,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

@Freezed(toJson: false)
class CartItem with _$CartItem {
  factory CartItem({
    required Product product,
    required double quantity,
  }) = _CartItem;

  factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}
