import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:search_apple_app/data/api.dart';
import 'package:search_apple_app/model/Photo.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;

  // StreamController 생성과 동시에 빈 리스트로 초기화
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  PhotoProvider({super.key, required super.child, required this.api,});

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  Future<void> fetch(String query) async{
    final result = await api.fetch(query);
    _photoStreamController.add(result);
  }

  //api에 변경이 있는지를 확인하는 bool 값을 retrun
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}