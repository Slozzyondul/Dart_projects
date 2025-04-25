// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_payload.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$$SignUpPayloadImplToJson(_$SignUpPayloadImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'account_type': _$AccountTypeEnumMap[instance.accountType]!,
    };

const _$AccountTypeEnumMap = {
  AccountType.seller: 'seller',
  AccountType.buyer: 'buyer',
};
