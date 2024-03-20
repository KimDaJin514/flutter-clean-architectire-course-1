import 'package:flutter_test/flutter_test.dart';
import 'package:search_apple_app/data/photo_api_repository.dart';
import 'package:search_apple_app/data/pixabay_api.dart';
import 'package:search_apple_app/model/photo.dart';
import 'package:search_apple_app/ui/home_viewmodel.dart';

void main() {
  test('Fetch func should work well', () async {
    // final viewModel = HomeViewModel(PixabayApi());
    // 이렇게 되면 PixabayApi 에 문제가 생기면 제대로 동작하지 않는다.
    // => HomeViewModel이 PixabayApi에 의존적이다.
    // PixabayApi 에 문제가 있어도 ViewModel을 테스트할 수 있도록 수정 필요
    // => PixabayApi 를 바로 사용하지말고 인터페이스(PhotoApiRepository)를 만들어서 사용한다.

    final viewModel = HomeViewModel(FakePhotoApiRepository());

    await viewModel.fetch('apple');

    final List<Photo> result = fakeJson.map((e) => Photo.fromJson(e)).toList();

    expect(viewModel.photos, result);
  });
}

class FakePhotoApiRepository extends PhotoApiRepository {
  @override
  Future<List<Photo>> fetch(String query) async {
    Future.delayed(const Duration(milliseconds: 500));

    return fakeJson.map((e) => Photo.fromJson(e)).toList();
  }
}

List<Map<String, dynamic>> fakeJson = [
  {
    "id": 8595521,
    "pageURL": "https://pixabay.com/photos/forsythia-flowers-branch-8595521/",
    "type": "photo",
    "tags": "forsythia, flower wallpaper, flowers",
    "previewURL":
        "https://cdn.pixabay.com/photo/2024/02/25/10/11/forsythia-8595521_150.jpg",
    "previewWidth": 112,
    "previewHeight": 150,
    "webformatURL":
        "https://pixabay.com/get/g23997aae65b687c26b90010b59a9c00eff7b6c29b3b5235b3d08f5aac9e88b1e9d763e5c06940ccc5116b3057ca812deb3f7d938fbbd3c8ad5b1dba0a053fd4f_640.jpg",
    "webformatWidth": 480,
    "webformatHeight": 640,
    "largeImageURL":
        "https://pixabay.com/get/g1973cb4146844aafe9b9e09a359b0864f4d50f2573222520575968feb8acce1b640cfd741b4e418ba8be0926b556a178edda05a09082b6d41b4462b4ef319e31_1280.jpg",
    "imageWidth": 3024,
    "imageHeight": 4032,
    "imageSize": 970371,
    "views": 25610,
    "downloads": 20213,
    "collections": 178,
    "likes": 1013,
    "comments": 38,
    "user_id": 10328767,
    "user": "Mylene2401",
    "userImageURL":
        "https://cdn.pixabay.com/user/2020/08/02/06-54-24-533_250x250.jpeg"
  },
  {
    "id": 3063284,
    "pageURL":
        "https://pixabay.com/photos/rose-flower-petal-floral-noble-3063284/",
    "type": "photo",
    "tags": "rose, flower, petal",
    "previewURL":
        "https://cdn.pixabay.com/photo/2018/01/05/16/24/rose-3063284_150.jpg",
    "previewWidth": 150,
    "previewHeight": 99,
    "webformatURL":
        "https://pixabay.com/get/g9311ecde0dba69a8eaaea85b5f7fab593da8b96c73d128b1ad500f7a3a8ce8110b31ead13bdf785e6d13520cfe461e2e42b1c743b6eaa1308ec00c22d73ad7b2_640.jpg",
    "webformatWidth": 640,
    "webformatHeight": 426,
    "largeImageURL":
        "https://pixabay.com/get/gaa91fa37311c1a876a6e438384e238efd7585fb463e94bc1679331a8f6b569b2ec3af7f26ca70a1bbd8693e3c52b03342bf60a2ccc3e8112325b1c3c5a762dbb_1280.jpg",
    "imageWidth": 6000,
    "imageHeight": 4000,
    "imageSize": 3574625,
    "views": 1190490,
    "downloads": 778807,
    "collections": 1606,
    "likes": 1737,
    "comments": 348,
    "user_id": 1564471,
    "user": "anncapictures",
    "userImageURL":
        "https://cdn.pixabay.com/user/2015/11/27/06-58-54-609_250x250.jpg"
  },
];
