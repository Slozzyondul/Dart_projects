import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:prototype2/repositories/search_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository searchRepository;
  SearchBloc({required this.searchRepository}) : super(SearchInitial()) {
    on<SearchQueryEvent>((event, emit) async {
      emit(SearchLoading());

      try {
        // Simulate a search operation (replace with actual search logic)
        await Future.delayed(Duration(seconds: 2));
        // Assuming search returns a list of image URLs
        final images = List.generate(
            10, (index) => ImageData('https://example.com/image_$index.jpg'));
        emit(SearchLoaded(images));
      } catch (e) {
        emit(SearchError('Failed to load search results'));
      }
    });
  }
}
