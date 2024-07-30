import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prototype2/repositories/image_repository.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  final ImageRepository imageRepository;
  UploadBloc({required this.imageRepository}) : super(UploadInitial()) {
    on<StartUpload>((event, emit) {
      emit(UploadLoading([])); // Start with an empty list of images
    });

    on<UploadImageEvent>((event, emit) async {
      if (state is UploadLoading) {
        final currentState = state as UploadLoading;
        // Simulate an upload and get a URL (for example purposes, use the local path as URL)
        final imageUrl = event.imageFile.path;

        final updatedImages = [...currentState.images, ImageData(imageUrl)];
        emit(UploadLoading(updatedImages));
      }
    });

    on<FinishUpload>((event, emit) {
      if (state is UploadLoading) {
        final currentState = state as UploadLoading;
        emit(UploadLoaded(currentState.images));
      }
    });
  }
}
