import 'package:flutter/cupertino.dart';

import '../ui/home_viewmodel.dart';

// InheritedWidget 사용

// class PhotoProvider extends InheritedWidget {
//   final HomeViewModel viewModel;
//   const PhotoProvider({super.key, required super.child, required this.viewModel});
//
//   static PhotoProvider of(BuildContext context) {
//     final PhotoProvider? result = context.dependOnInheritedWidgetOfExactType<PhotoProvider>();
//     assert(result != null, 'No PixabayApi found in context');
//     return result!;
//   }
//
//   //api에 변경이 있는지를 확인하는 bool 값을 retrun
//   @override
//   bool updateShouldNotify(PhotoProvider oldWidget) {
//     return true;
//   }
// }

