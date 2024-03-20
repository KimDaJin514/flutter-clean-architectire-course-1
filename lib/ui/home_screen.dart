import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_apple_app/data/pixabay_api.dart';
import 'package:search_apple_app/data/photo_provider.dart';
import 'package:search_apple_app/model/photo.dart';
import 'package:search_apple_app/ui/home_viewmodel.dart';
import 'package:search_apple_app/ui/widget/photo_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textCtrl = TextEditingController();

  @override
  void dispose() {
    _textCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // InheritedWidget 사용
    // final viewModel = PhotoProvider.of(context).viewModel;

    // Provider 라이브러리 사용 1 (예전 방식)
    // final viewModel = Provider.of<HomeViewModel>(context);

    // Provider 2 - Widget build(BuildContext context) 가 전체 리빌드
    final viewModel = context.watch<HomeViewModel>();

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
                    // viewModel.fetch(_textCtrl.text);

                    context.read<HomeViewModel>().fetch(_textCtrl.text);
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 35,
                  ),
                ),
                isDense: true),
            ),const SizedBox(height: 20,),
            // StreamBuilder<List<Photo>>(
            //   stream: viewModel.photoStream,
            //   builder: (context, snapshot) {
            //     if(!snapshot.hasData) {
            //       return const CircularProgressIndicator();
            //     }
            //
            //     final photos = snapshot.data!;
            //     return Expanded(
            //       child: GridView.builder(
            //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2,
            //           crossAxisSpacing: 16,
            //           mainAxisSpacing: 16,
            //         ),
            //         itemCount: photos.length,
            //         itemBuilder: (context, index) {
            //           return PhotoWidget(photo: photos[index],);
            //         },
            //       ),
            //     );
            //   }
            // ),

            Consumer<HomeViewModel>(
              builder: (_, viewModel, child) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: viewModel.photos.length,
                    itemBuilder: (context, index) {
                      return PhotoWidget(photo: viewModel.photos[index],);
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}


