import 'package:flutter/material.dart';
import 'package:search_apple_app/data/api.dart';
import 'package:search_apple_app/data/photo_provider.dart';
import 'package:search_apple_app/ui/home_screen.dart';

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
      home: PhotoProvider(
        api: PixabayApi(),
        child: const HomeScreen()),
    );
  }
}




