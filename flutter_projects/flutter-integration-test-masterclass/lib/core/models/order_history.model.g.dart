// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_history.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderHistoryImpl _$$OrderHistoryImplFromJson(Map<String, dynamic> json) =>
    _$OrderHistoryImpl(
      id: (json['id'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      buyerId: (json['buyer_id'] as num).toInt(),
      sellerId: (json['seller_id'] as num).toInt(),
      buyerName: json['buyer_name'] as String,
      sellerName: json['seller_name'] as String,
    );
