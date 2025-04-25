// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_payload.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignUpPayload {
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String get retypePassword => throw _privateConstructorUsedError;
  @JsonKey(name: "account_type")
  AccountType get accountType => throw _privateConstructorUsedError;

  /// Serializes this SignUpPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SignUpPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignUpPayloadCopyWith<SignUpPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpPayloadCopyWith<$Res> {
  factory $SignUpPayloadCopyWith(
          SignUpPayload value, $Res Function(SignUpPayload) then) =
      _$SignUpPayloadCopyWithImpl<$Res, SignUpPayload>;
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      @JsonKey(includeToJson: false) String retypePassword,
      @JsonKey(name: "account_type") AccountType accountType});
}

/// @nodoc
class _$SignUpPayloadCopyWithImpl<$Res, $Val extends SignUpPayload>
    implements $SignUpPayloadCopyWith<$Res> {
  _$SignUpPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignUpPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? retypePassword = null,
    Object? accountType = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      retypePassword: null == retypePassword
          ? _value.retypePassword
          : retypePassword // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignUpPayloadImplCopyWith<$Res>
    implements $SignUpPayloadCopyWith<$Res> {
  factory _$$SignUpPayloadImplCopyWith(
          _$SignUpPayloadImpl value, $Res Function(_$SignUpPayloadImpl) then) =
      __$$SignUpPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String password,
      @JsonKey(includeToJson: false) String retypePassword,
      @JsonKey(name: "account_type") AccountType accountType});
}

/// @nodoc
class __$$SignUpPayloadImplCopyWithImpl<$Res>
    extends _$SignUpPayloadCopyWithImpl<$Res, _$SignUpPayloadImpl>
    implements _$$SignUpPayloadImplCopyWith<$Res> {
  __$$SignUpPayloadImplCopyWithImpl(
      _$SignUpPayloadImpl _value, $Res Function(_$SignUpPayloadImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignUpPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? retypePassword = null,
    Object? accountType = null,
  }) {
    return _then(_$SignUpPayloadImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      retypePassword: null == retypePassword
          ? _value.retypePassword
          : retypePassword // ignore: cast_nullable_to_non_nullable
              as String,
      accountType: null == accountType
          ? _value.accountType
          : accountType // ignore: cast_nullable_to_non_nullable
              as AccountType,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$SignUpPayloadImpl implements _SignUpPayload {
  _$SignUpPayloadImpl(
      {required this.name,
      required this.email,
      required this.password,
      @JsonKey(includeToJson: false) required this.retypePassword,
      @JsonKey(name: "account_type") required this.accountType});

  @override
  final String name;
  @override
  final String email;
  @override
  final String password;
  @override
  @JsonKey(includeToJson: false)
  final String retypePassword;
  @override
  @JsonKey(name: "account_type")
  final AccountType accountType;

  @override
  String toString() {
    return 'SignUpPayload(name: $name, email: $email, password: $password, retypePassword: $retypePassword, accountType: $accountType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpPayloadImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.retypePassword, retypePassword) ||
                other.retypePassword == retypePassword) &&
            (identical(other.accountType, accountType) ||
                other.accountType == accountType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, email, password, retypePassword, accountType);

  /// Create a copy of SignUpPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpPayloadImplCopyWith<_$SignUpPayloadImpl> get copyWith =>
      __$$SignUpPayloadImplCopyWithImpl<_$SignUpPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignUpPayloadImplToJson(
      this,
    );
  }
}

abstract class _SignUpPayload implements SignUpPayload {
  factory _SignUpPayload(
      {required final String name,
      required final String email,
      required final String password,
      @JsonKey(includeToJson: false) required final String retypePassword,
      @JsonKey(name: "account_type")
      required final AccountType accountType}) = _$SignUpPayloadImpl;

  @override
  String get name;
  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(includeToJson: false)
  String get retypePassword;
  @override
  @JsonKey(name: "account_type")
  AccountType get accountType;

  /// Create a copy of SignUpPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpPayloadImplCopyWith<_$SignUpPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
