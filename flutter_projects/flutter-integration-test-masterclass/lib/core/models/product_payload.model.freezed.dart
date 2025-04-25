// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_payload.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductPayload {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;

  /// Serializes this ProductPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductPayloadCopyWith<ProductPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPayloadCopyWith<$Res> {
  factory $ProductPayloadCopyWith(
          ProductPayload value, $Res Function(ProductPayload) then) =
      _$ProductPayloadCopyWithImpl<$Res, ProductPayload>;
  @useResult
  $Res call({int? id, String? name, double? price});
}

/// @nodoc
class _$ProductPayloadCopyWithImpl<$Res, $Val extends ProductPayload>
    implements $ProductPayloadCopyWith<$Res> {
  _$ProductPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductPayloadImplCopyWith<$Res>
    implements $ProductPayloadCopyWith<$Res> {
  factory _$$ProductPayloadImplCopyWith(_$ProductPayloadImpl value,
          $Res Function(_$ProductPayloadImpl) then) =
      __$$ProductPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, double? price});
}

/// @nodoc
class __$$ProductPayloadImplCopyWithImpl<$Res>
    extends _$ProductPayloadCopyWithImpl<$Res, _$ProductPayloadImpl>
    implements _$$ProductPayloadImplCopyWith<$Res> {
  __$$ProductPayloadImplCopyWithImpl(
      _$ProductPayloadImpl _value, $Res Function(_$ProductPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? price = freezed,
  }) {
    return _then(_$ProductPayloadImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ProductPayloadImpl implements _ProductPayload {
  _$ProductPayloadImpl(
      {required this.id, required this.name, required this.price});

  @override
  final int? id;
  @override
  final String? name;
  @override
  final double? price;

  @override
  String toString() {
    return 'ProductPayload(id: $id, name: $name, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPayloadImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, price);

  /// Create a copy of ProductPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPayloadImplCopyWith<_$ProductPayloadImpl> get copyWith =>
      __$$ProductPayloadImplCopyWithImpl<_$ProductPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPayloadImplToJson(
      this,
    );
  }
}

abstract class _ProductPayload implements ProductPayload {
  factory _ProductPayload(
      {required final int? id,
      required final String? name,
      required final double? price}) = _$ProductPayloadImpl;

  @override
  int? get id;
  @override
  String? get name;
  @override
  double? get price;

  /// Create a copy of ProductPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductPayloadImplCopyWith<_$ProductPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
