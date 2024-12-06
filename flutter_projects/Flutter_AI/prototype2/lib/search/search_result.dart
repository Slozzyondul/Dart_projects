import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype2/search/bloc/search_bloc.dart';

class SearchResultsScreen extends StatelessWidget {
  final String query;

  SearchResultsScreen({required this.query});

  @override
  Widget build(BuildContext context) {
    context.read<SearchBloc>().add(SearchQueryEvent(query));

    return Scaffold(
      appBar: AppBar(title: Text('Search Results')),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SearchLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
              ),
              itemCount: state.images.length,
              itemBuilder: (context, index) {
                return Image.network(state.images[index].url);
              },
            );
          } else {
            return Center(child: Text('No images found.'));
          }
        },
      ),
    );
  }
}
