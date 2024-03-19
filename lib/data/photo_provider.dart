import 'package:flutter/cupertino.dart';
import 'package:search_apple_app/data/api.dart';

class PhotoProvider extends InheritedWidget {
  final PixabayApi api;
  const PhotoProvider({super.key, required super.child, required this.api,});

  static PhotoProvider of(BuildContext context) {
    final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
    assert(result != null, 'No PixabayApi found in context');
    return result!;
  }

  //api에 변경이 있는지를 확인하는
  @override
  bool updateShouldNotify(PhotoProvider oldWidget) {
    return oldWidget.api != api;
  }
}