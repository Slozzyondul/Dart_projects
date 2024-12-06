part of 'upload_bloc.dart';

@immutable
abstract class UploadEvent {}

class StartUpload extends UploadEvent {}

class UploadImageEvent extends UploadEvent {
  final File imageFile;

  UploadImageEvent(this.imageFile);
}

class FinishUpload extends UploadEvent {}
