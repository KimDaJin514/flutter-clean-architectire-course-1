import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:search_apple_app/data/data_source/result.dart';
import 'package:search_apple_app/domain/repository/photo_api_repository.dart';
import 'package:search_apple_app/domain/model/photo.dart';
import 'package:search_apple_app/presentation/home/home_state.dart';
import 'package:search_apple_app/presentation/home/home_ui_event.dart';

// class HomeViewModel {
//   // final PixabayApi api;
//   final PhotoApiRepository repository;
//
//   // StreamController 생성과 동시에 빈 리스트로 초기화
//   final _photoStreamController = StreamController<List<Photo>>()..add([]);
//   Stream<List<Photo>> get photoStream => _photoStreamController.stream;
//
//   HomeViewModel(this.repository);
//
//   Future<void> fetch(String query) async{
//     final result = await repository.fetch(query);
//     _photoStreamController.add(result);
//   }
// }

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  // * 뷰모델에서 외부로 보여지는 데이터들은 불변 객체로 읽기 전용으로 만들자 !!
  HomeState _state = const HomeState([], false);
  HomeState get state => _state;

  final _eventController = StreamController<HomeUiEvent>();
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);

  // List<Photo> _photos = [];
  // // List<Photo> get photos => _photos;
  // // 밖에서 수정하지 못 하도록
  // UnmodifiableListView<Photo> get photos => UnmodifiableListView(_photos);

  Future<void> fetch(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final Result<List<Photo>> result = await repository.fetch(query);

    result.when(
      success: (photos) {
        // _photos = photos;
        _state = state.copyWith(photos: photos);
        notifyListeners();
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
