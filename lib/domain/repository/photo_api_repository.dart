import 'package:search_apple_app/data/data_source/result.dart';
import 'package:search_apple_app/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<Result<List<Photo>>> fetch(String query);
}