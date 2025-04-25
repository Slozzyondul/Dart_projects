import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_payload.model.g.dart';
part 'sign_up_payload.model.freezed.dart';

enum AccountType {
  @JsonValue("seller")
  seller,
  @JsonValue("buyer")
  buyer
}

@Freezed(toJson: true)
class SignUpPayload with _$SignUpPayload {
  factory SignUpPayload({
    required String name,
    required String email,
    required String password,
    @JsonKey(includeToJson: false) required String retypePassword,
    @JsonKey(name: "account_type") required AccountType accountType,
  }) = _SignUpPayload;
}
