import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prototype2/authentication/bloc/authentication_bloc.dart';
import 'package:prototype2/authentication/login.dart';
import 'package:prototype2/home/home.dart';
import 'package:prototype2/repositories/authentication_repository.dart';
import 'package:prototype2/repositories/image_repository.dart';
import 'package:prototype2/repositories/search_repository.dart';
import 'package:prototype2/search/bloc/search_bloc.dart';
import 'package:prototype2/search/search_result.dart';
import 'package:prototype2/services/api_service.dart';
import 'package:prototype2/services/database_service.dart';
import 'package:prototype2/upload/bloc/upload_bloc.dart';
import 'package:prototype2/upload/uploads.dart';

void main() {
  final apiService = ApiService(baseUrl: 'http://localhost:5000');
  final databaseService = DatabaseService();

  runApp(MyApp(
    authRepository: AuthenticationRepository(apiService: apiService),
    imageRepository: ImageRepository(
        apiService: apiService, databaseService: databaseService),
    searchRepository: SearchRepository(apiService: apiService),
  ));
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository authRepository;
  final ImageRepository imageRepository;
  final SearchRepository searchRepository;

  MyApp({
    required this.authRepository,
    required this.imageRepository,
    required this.searchRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(authenticationRepository: authRepository),
        ),
        BlocProvider<UploadBloc>(
          create: (context) => UploadBloc(imageRepository: imageRepository),
        ),
        BlocProvider<SearchBloc>(
          create: (context) => SearchBloc(searchRepository: searchRepository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Search App',
        initialRoute: '/search',
        routes: {
          '/': (context) => LoginScreen(),
          '/home': (context) => Home(),
          '/upload': (context) => UploadScreen(),
          '/search': (context) => SearchResultsScreen(query: ''),
        },
      ),
    );
  }
}
