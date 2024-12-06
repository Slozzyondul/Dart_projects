class User {
  final int userId;
  final String user_name;
  final String phoneNumber;
  final String idNumber;
  final String email;

  User({
    required this.userId,
    required this.user_name,
    required this.phoneNumber,
    required this.idNumber,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      user_name: json['user_name'],
      phoneNumber: json['phone_number'],
      idNumber: json['id_number'],
      email: json['email'],
    );
  }
}
