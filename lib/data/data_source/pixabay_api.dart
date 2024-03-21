import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_apple_app/data/data_source/result.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '42950261-4528e55abc18bdd3aa00bcbe9';

  Future<Result<Iterable>> fetch(String query) async{
    try {
      final response = await client.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];

      return Result.success(hits);
    }catch (e){
      return Result.error('에러 발생');
    }

  }

}