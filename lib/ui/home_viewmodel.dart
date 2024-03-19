import 'dart:async';

import 'package:search_apple_app/data/photo_api_repository.dart';
import 'package:search_apple_app/model/Photo.dart';

class HomeViewModel {
  // final PixabayApi api;
  final PhotoApiRepository repository;

  // StreamController 생성과 동시에 빈 리스트로 초기화
  final _photoStreamController = StreamController<List<Photo>>()..add([]);
  Stream<List<Photo>> get photoStream => _photoStreamController.stream;

  HomeViewModel(this.repository);

  Future<void> fetch(String query) async{
    final result = await repository.fetch(query);
    _photoStreamController.add(result);
  }
}