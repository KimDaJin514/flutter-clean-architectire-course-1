import 'package:search_apple_app/domain/model/photo.dart';

class HomeState {
  final List<Photo> photos;
  final bool isLoading;

  HomeState(this.photos, this.isLoading);

  // 외부에서 함부로 값을 변경하는 것을 방지하기 위해
  // 변수를 final로 선언하여 변경하지 못 하게 하고
  // copy 함수를 활용하여 값을 새로 만들도록 수정
  HomeState copy({List<Photo>? photos, bool? isLoading}) {
    return HomeState(
      photos ??= this.photos,
      isLoading ?? this.isLoading,
    );
  }
}
