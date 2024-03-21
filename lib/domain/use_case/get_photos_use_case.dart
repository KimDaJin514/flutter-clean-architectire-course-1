import 'dart:math';

import 'package:search_apple_app/data/data_source/result.dart';

import '../model/photo.dart';
import '../repository/photo_api_repository.dart';


// use case 는
// view model이 데이터를 전달받아 바로 view에 넘겨주는 역할만 할 수 있도록
// 세부 비즈니스 로직을 다룬다.
class GetPhotosUseCase {
  final PhotoApiRepository repository;
  GetPhotosUseCase(this.repository);

  // Future<Result<List<Photo>>> execute(String query) async{
  Future<Result<List<Photo>>> call(String query) async{
    final result = await repository.fetch(query);

    switch(result) {
      case Success<List<Photo>>():
        return Result.success(result.data.sublist(0, min(4, result.data.length)));
      case Error<List<Photo>>():
        return Result.error(result.message);
    }
  }
}