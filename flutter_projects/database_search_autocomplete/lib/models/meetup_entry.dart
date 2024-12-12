class MeetupsEntry {
  const MeetupsEntry({
    required this.link,
    required this.name,
    required this.location,
  });

  final String link;
  final String name;
  final String location;

  static MeetupsEntry fromJson(Map<String, dynamic> json) {
    return MeetupsEntry(
      link: json['link'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
    );
  }
}