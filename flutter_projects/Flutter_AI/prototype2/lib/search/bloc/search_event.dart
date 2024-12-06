part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class SearchQueryEvent extends SearchEvent {
  final String query;

  SearchQueryEvent(this.query);
}
