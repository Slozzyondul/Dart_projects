import 'package:queryingapi/model/dob_users.dart';
import 'package:queryingapi/model/full_name.dart';
import 'package:queryingapi/model/location_users.dart';
import 'package:queryingapi/model/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final DobUsers dob;
  final LocationUsers location;
  final UserPicture picture;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> json) {
    final name = UserName.fromMap(json['name'] ?? {});

    final dob = DobUsers.fromMap(json['dob']);
    final location = LocationUsers.fromMap(json['location']);
    final picture = UserPicture.fromMap(json['picture'] ?? {});
    return User(
      cell: json['cell'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      nat: json['nat'] ?? '',
      phone: json['phone'] ?? "",
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullUserName {
    return '${name.title} ${name.first} ${name.last}';
  }
}
