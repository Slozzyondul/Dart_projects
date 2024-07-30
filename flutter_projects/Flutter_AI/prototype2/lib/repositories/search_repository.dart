import '../services/api_service.dart';
import 'package:prototype2/models/search.dart';

class SearchRepository {
  final ApiService apiService;

  SearchRepository({required this.apiService});

  Future<List<SearchResult>> search(String query) async {
    // Call API to perform search
    final searchResults = await apiService.search(query);
    // Convert API response to a list of SearchResult objects
    return searchResults
        .map((result) => SearchResult.fromJson(result))
        .toList();
  }

  // Other methods like getting search history...
}
