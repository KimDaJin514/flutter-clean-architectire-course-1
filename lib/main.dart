import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_apple_app/data/data_source/pixabay_api.dart';
import 'package:search_apple_app/data/respository/photo_api_repository_impl.dart';
import 'package:search_apple_app/trash/photo_provider.dart';
import 'package:search_apple_app/presentation/home/home_screen.dart';
import 'package:search_apple_app/presentation/home/home_viewmodel.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Practice App',
      debugShowCheckedModeBanner: false,
      // InheritedWidget 사용
      // home: PhotoProvider(
      //   viewModel: HomeViewModel(PixabayApi()),
      //   child: const HomeScreen()),

      // Provider 사용
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(PhotoApiRepositoryImpl(PixabayApi(http.Client()))),
        child: const HomeScreen(),
      ),
    );
  }
}




