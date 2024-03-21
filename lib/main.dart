import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_apple_app/di/provider_setup.dart';
import 'package:search_apple_app/presentation/home/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: globalProviders,
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Clean Architecture Practice App',
      debugShowCheckedModeBanner: false,
      // InheritedWidget 사용
      // home: PhotoProvider(
      //   viewModel: HomeViewModel(PixabayApi()),
      //   child: const HomeScreen()),

      // Provider 사용
      // home: ChangeNotifierProvider(
      //   create: (_) => HomeViewModel(GetPhotosUseCase(PhotoApiRepositoryImpl(PixabayApi(http.Client())))),
      //   child: const HomeScreen(),
      // ),

      home: HomeScreen(),
    );
  }
}




