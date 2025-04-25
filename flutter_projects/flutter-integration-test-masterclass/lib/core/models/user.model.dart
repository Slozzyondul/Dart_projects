import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.model.g.dart';
part 'user.model.freezed.dart';

@freezed
class User with _$User {
  factory User({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'account_type') required String accountType,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
