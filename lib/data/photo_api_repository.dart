import 'package:search_apple_app/model/Photo.dart';

abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}