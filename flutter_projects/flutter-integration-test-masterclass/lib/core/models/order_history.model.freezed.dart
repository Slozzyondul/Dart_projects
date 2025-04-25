// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_history.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) {
  return _OrderHistory.fromJson(json);
}

/// @nodoc
mixin _$OrderHistory {
  int get id => throw _privateConstructorUsedError;
  List<CartItem> get items => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_id')
  int get buyerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller_id')
  int get sellerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'buyer_name')
  String get buyerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller_name')
  String get sellerName => throw _privateConstructorUsedError;

  /// Create a copy of OrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderHistoryCopyWith<OrderHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderHistoryCopyWith<$Res> {
  factory $OrderHistoryCopyWith(
          OrderHistory value, $Res Function(OrderHistory) then) =
      _$OrderHistoryCopyWithImpl<$Res, OrderHistory>;
  @useResult
  $Res call(
      {int id,
      List<CartItem> items,
      @JsonKey(name: 'buyer_id') int buyerId,
      @JsonKey(name: 'seller_id') int sellerId,
      @JsonKey(name: 'buyer_name') String buyerName,
      @JsonKey(name: 'seller_name') String sellerName});
}

/// @nodoc
class _$OrderHistoryCopyWithImpl<$Res, $Val extends OrderHistory>
    implements $OrderHistoryCopyWith<$Res> {
  _$OrderHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? buyerId = null,
    Object? sellerId = null,
    Object? buyerName = null,
    Object? sellerName = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as int,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderHistoryImplCopyWith<$Res>
    implements $OrderHistoryCopyWith<$Res> {
  factory _$$OrderHistoryImplCopyWith(
          _$OrderHistoryImpl value, $Res Function(_$OrderHistoryImpl) then) =
      __$$OrderHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      List<CartItem> items,
      @JsonKey(name: 'buyer_id') int buyerId,
      @JsonKey(name: 'seller_id') int sellerId,
      @JsonKey(name: 'buyer_name') String buyerName,
      @JsonKey(name: 'seller_name') String sellerName});
}

/// @nodoc
class __$$OrderHistoryImplCopyWithImpl<$Res>
    extends _$OrderHistoryCopyWithImpl<$Res, _$OrderHistoryImpl>
    implements _$$OrderHistoryImplCopyWith<$Res> {
  __$$OrderHistoryImplCopyWithImpl(
      _$OrderHistoryImpl _value, $Res Function(_$OrderHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? items = null,
    Object? buyerId = null,
    Object? sellerId = null,
    Object? buyerName = null,
    Object? sellerName = null,
  }) {
    return _then(_$OrderHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      buyerId: null == buyerId
          ? _value.buyerId
          : buyerId // ignore: cast_nullable_to_non_nullable
              as int,
      sellerId: null == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as int,
      buyerName: null == buyerName
          ? _value.buyerName
          : buyerName // ignore: cast_nullable_to_non_nullable
              as String,
      sellerName: null == sellerName
          ? _value.sellerName
          : sellerName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$OrderHistoryImpl implements _OrderHistory {
  _$OrderHistoryImpl(
      {required this.id,
      required final List<CartItem> items,
      @JsonKey(name: 'buyer_id') required this.buyerId,
      @JsonKey(name: 'seller_id') required this.sellerId,
      @JsonKey(name: 'buyer_name') required this.buyerName,
      @JsonKey(name: 'seller_name') required this.sellerName})
      : _items = items;

  factory _$OrderHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderHistoryImplFromJson(json);

  @override
  final int id;
  final List<CartItem> _items;
  @override
  List<CartItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey(name: 'buyer_id')
  final int buyerId;
  @override
  @JsonKey(name: 'seller_id')
  final int sellerId;
  @override
  @JsonKey(name: 'buyer_name')
  final String buyerName;
  @override
  @JsonKey(name: 'seller_name')
  final String sellerName;

  @override
  String toString() {
    return 'OrderHistory(id: $id, items: $items, buyerId: $buyerId, sellerId: $sellerId, buyerName: $buyerName, sellerName: $sellerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.buyerId, buyerId) || other.buyerId == buyerId) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.buyerName, buyerName) ||
                other.buyerName == buyerName) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_items),
      buyerId,
      sellerId,
      buyerName,
      sellerName);

  /// Create a copy of OrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      __$$OrderHistoryImplCopyWithImpl<_$OrderHistoryImpl>(this, _$identity);
}

abstract class _OrderHistory implements OrderHistory {
  factory _OrderHistory(
          {required final int id,
          required final List<CartItem> items,
          @JsonKey(name: 'buyer_id') required final int buyerId,
          @JsonKey(name: 'seller_id') required final int sellerId,
          @JsonKey(name: 'buyer_name') required final String buyerName,
          @JsonKey(name: 'seller_name') required final String sellerName}) =
      _$OrderHistoryImpl;

  factory _OrderHistory.fromJson(Map<String, dynamic> json) =
      _$OrderHistoryImpl.fromJson;

  @override
  int get id;
  @override
  List<CartItem> get items;
  @override
  @JsonKey(name: 'buyer_id')
  int get buyerId;
  @override
  @JsonKey(name: 'seller_id')
  int get sellerId;
  @override
  @JsonKey(name: 'buyer_name')
  String get buyerName;
  @override
  @JsonKey(name: 'seller_name')
  String get sellerName;

  /// Create a copy of OrderHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderHistoryImplCopyWith<_$OrderHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
