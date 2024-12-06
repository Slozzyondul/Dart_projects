class DobUsers {
  final DateTime date;
  final int age;

  DobUsers({
    required this.age,
    required this.date,
  });

  factory DobUsers.fromMap(Map<String, dynamic> json) {
    return DobUsers(
      age: json['age'] as int,
      date: DateTime.parse(json['date']),
    );
  }
}
