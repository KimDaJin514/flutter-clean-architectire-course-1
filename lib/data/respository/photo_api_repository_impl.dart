import 'dart:convert';

import 'package:search_apple_app/data/data_source/pixabay_api.dart';
import 'package:search_apple_app/domain/repository/photo_api_repository.dart';
import 'package:search_apple_app/domain/model/photo.dart';
import 'package:http/http.dart' as http;

class PhotoApiRepositoryImpl implements PhotoApiRepository{
  PixabayApi api;
  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query) async{
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }

}