import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_starter/core/models/cart.model.dart';

part 'order_history.model.g.dart';
part 'order_history.model.freezed.dart';

@Freezed(toJson: false)
class OrderHistory with _$OrderHistory {
  factory OrderHistory({
    required int id,
    required List<CartItem> items,
    @JsonKey(name: 'buyer_id') required int buyerId,
    @JsonKey(name: 'seller_id') required int sellerId,
    @JsonKey(name: 'buyer_name') required String buyerName,
    @JsonKey(name: 'seller_name') required String sellerName,
  }) = _OrderHistory;

  factory OrderHistory.fromJson(Map<String, dynamic> json) => _$OrderHistoryFromJson(json);
}
