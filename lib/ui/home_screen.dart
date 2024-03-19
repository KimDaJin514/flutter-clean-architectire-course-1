import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_apple_app/data/api.dart';
import 'package:search_apple_app/model/Photo.dart';
import 'package:search_apple_app/ui/widget/photo_widget.dart';

class HomeScreen extends StatefulWidget {
  final PixabayApi api;
  const HomeScreen({super.key, required this.api});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textCtrl = TextEditingController();
  List<Photo> _photos = [];

  @override
  void dispose() {
    _textCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 검색 앱',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textCtrl,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () async{
                    final photos = await widget.api.fetch(_textCtrl.text);
                    setState(() {
                      _photos = photos;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 35,
                  ),
                ),
                isDense: true),
            ),const SizedBox(height: 20,),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _photos.length,
                itemBuilder: (context, index) {
                  return PhotoWidget(photo: _photos[index],);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


