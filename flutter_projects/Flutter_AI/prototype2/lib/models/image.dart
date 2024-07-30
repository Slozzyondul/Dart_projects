class ImageModel {
  final int? id;
  final String url;
  final DateTime dateUploaded;

  ImageModel({this.id, required this.url, required this.dateUploaded});

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      url: map['url'],
      dateUploaded: DateTime.parse(map['dateUploaded']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'dateUploaded': dateUploaded.toIso8601String(),
    };
  }
}
