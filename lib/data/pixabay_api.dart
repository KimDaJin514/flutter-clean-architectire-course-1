import 'dart:convert';

import 'package:search_apple_app/data/photo_api_repository.dart';
import 'package:search_apple_app/model/Photo.dart';
import 'package:http/http.dart' as http;

class PixabayApi implements PhotoApiRepository{
  final baseUrl = 'https://pixabay.com/api/';
  final key = '42950261-4528e55abc18bdd3aa00bcbe9';

  Future<List<Photo>> fetch(String query) async{
    final response = await http.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));

    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }

}