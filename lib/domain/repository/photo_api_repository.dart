import 'package:search_apple_app/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<List<Photo>> fetch(String query);
}