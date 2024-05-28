// abstract class Result<T>{
//   factory Result.success(T data) = Success;
//   factory Result.error(String message) = Error;
// }
//
// class Success<T> implements Result<T> {
//   final T data;
//   Success(this.data);
// }
//
// class Error<T> implements Result<T> {
//   final String message;
//   Error(this.message);
// }


// freezed 사용 (Legacy)
// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'result.freezed.dart';

// freezed 사용 - Legacy
// @freezed
// abstract class Result<T> with _$Result<T> {
//   const factory Result.success(T data) = Success;
//   const factory Result.error(String message) = Error;
// }



sealed class Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(String message) = Error;
}

class Success<T> implements Result<T> {
  final T data;
  const Success(this.data);
}

class Error<T> implements Result<T> {
  final String message;
  const Error(this.message);
}