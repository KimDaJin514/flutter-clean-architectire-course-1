// 기본 Photo 모델
// class Photo {
//   Photo({
//     required this.id,
//     required this.pageUrl,
//     required this.type,
//     required this.tags,
//     required this.duration,
//     required this.pictureId,
//     required this.views,
//     required this.downloads,
//     required this.likes,
//     required this.comments,
//     required this.userId,
//     required this.user,
//     required this.userImageUrl,
//   });
//
//   factory Photo.fromJson(dynamic json) => Photo(
//     id: json["id"],
//     pageUrl: json["pageURL"],
//     type: json["type"],
//     tags: json["tags"],
//     duration: json["duration"] ?? 0,
//     pictureId: json["picture_id"] ??'',
//     views: json["views"],
//     downloads: json["downloads"],
//     likes: json["likes"],
//     comments: json["comments"],
//     userId: json["user_id"],
//     user: json["user"],
//     userImageUrl: json["userImageURL"],
//   );
//
//   late final int id;
//   late final String pageUrl;
//   late final String type;
//   late final String tags;
//   late final int duration;
//   late final String pictureId;
//   late final int views;
//   late final int downloads;
//   late final int likes;
//   late final int comments;
//   late final int userId;
//   late final String user;
//   late final String userImageUrl;
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "pageURL": pageUrl,
//     "type": type,
//     "tags": tags,
//     "duration": duration,
//     "picture_id": pictureId,
//     "views": views,
//     "downloads": downloads,
//     "likes": likes,
//     "comments": comments,
//     "user_id": userId,
//     "user": user,
//     "userImageURL": userImageUrl,
//   };
//
//   // 기존엔 해시코드가 같아야 같은 값으로 보지만
//   // id 가 동일하면 같은 값으로 보기로 재정의
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is Photo && runtimeType == other.runtimeType && id == other.id;
//
//   @override
//   int get hashCode => id.hashCode;
//
//   @override
//   String toString() {
//     return 'Photo{id: $id}';
//   }
// }


// JsonSerializable 사용 모델

// import 'package:equatable/equatable.dart';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'photo.g.dart';
//
// @JsonSerializable()
// class Photo extends Equatable{
//   final int id;
//   final String tags;
//
//   @JsonKey(name: 'userImageURL')
//   final String userImageUrl;
//
//   const Photo({
//     required this.id,
//     required this.tags,
//     required this.userImageUrl,
//   });
//
//   factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
//
//   Map<String, dynamic> toJson() => _$PhotoToJson(this);
//
//   @override
//   List<Object?> get props => [id];
// }



// Freezed 사용 모델
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.freezed.dart';
part 'photo.g.dart';

@freezed
class Photo with _$Photo {
  factory Photo({
    required int id,
    required String tags,
    required String userImageURL,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}