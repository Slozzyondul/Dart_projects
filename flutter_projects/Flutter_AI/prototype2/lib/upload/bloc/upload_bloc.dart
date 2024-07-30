import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'upload_event.dart';
part 'upload_state.dart';

class UploadBloc extends Bloc<UploadEvent, UploadState> {
  UploadBloc() : super(UploadInitial()) {
    on<UploadEvent>((event, emit) {});
  }
}
