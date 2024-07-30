part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<ImageData> images;

  SearchLoaded(this.images);
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);
}

class ImageData {
  final String url;

  ImageData(this.url);
}
