class User {
  final String id;
  final String username;

  User({required this.id, required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(id: json['id'], username: json['username']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username};
  }
}
