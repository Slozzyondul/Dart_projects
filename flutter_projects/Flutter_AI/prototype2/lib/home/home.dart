import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype2/upload/bloc/upload_bloc.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.upload_file),
            onPressed: () {
              Navigator.pushNamed(context, '/upload');
            },
          ),
        ],
      ),
      body: BlocBuilder<UploadBloc, UploadState>(
        builder: (context, state) {
          if (state is UploadLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UploadLoaded) {
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
            return Center(child: Text('No images uploaded yet.'));
          }
        },
      ),
    );
  }
}
