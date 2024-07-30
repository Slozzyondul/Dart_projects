import 'dart:io';
import '../services/api_service.dart';
import '../services/database_service.dart';
import '../models/image.dart';

class ImageRepository {
  final ApiService apiService;
  final DatabaseService databaseService;

  ImageRepository({required this.apiService, required this.databaseService});

  Future<void> uploadImage(File image) async {
    // Upload image to server and save metadata locally
    final imageUrl = await apiService.uploadImage(image);
    final imageMetadata =
        ImageModel(url: imageUrl, dateUploaded: DateTime.now());
    await databaseService.saveImageMetadata(imageMetadata);
  }

  // Other methods like fetching images...
}
