import 'package:flutter_starter/core/models/user.model.dart';

extension UserExtension on User {
  bool get isSeller => accountType == "seller";
}
