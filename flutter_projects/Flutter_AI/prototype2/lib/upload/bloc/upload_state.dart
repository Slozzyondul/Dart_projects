part of 'upload_bloc.dart';

@immutable
abstract class UploadState {}

class UploadInitial extends UploadState {}

class UploadLoading extends UploadState {
  final List<ImageData> images;

  UploadLoading(this.images);
}

class UploadLoaded extends UploadState {
  final List<ImageData> images;

  UploadLoaded(this.images);
}

class UploadError extends UploadState {
  final String message;

  UploadError(this.message);
}

class ImageData {
  final String url;

  ImageData(this.url);
}
