import 'dart:convert';

import 'package:search_apple_app/data/data_source/pixabay_api.dart';
import 'package:search_apple_app/data/data_source/result.dart';
import 'package:search_apple_app/domain/repository/photo_api_repository.dart';
import 'package:search_apple_app/domain/model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);

    // whene : freezed에서 제공하는 타입 검사 메서드
    // 기존 타입 검사는 if(A is B) 이렇게 했던 걸
    // when 으로 안전하게 사용 가능
    return result.when(
      success: (iterable) {
        return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}
