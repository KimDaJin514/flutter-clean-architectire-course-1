class Photo {
  Photo({
    required this.id,
    required this.pageUrl,
    required this.type,
    required this.tags,
    required this.duration,
    required this.pictureId,
    required this.views,
    required this.downloads,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  factory Photo.fromJson(dynamic json) => Photo(
    id: json["id"],
    pageUrl: json["pageURL"],
    type: json["type"],
    tags: json["tags"],
    duration: json["duration"] ?? 0,
    pictureId: json["picture_id"] ??'',
    views: json["views"],
    downloads: json["downloads"],
    likes: json["likes"],
    comments: json["comments"],
    userId: json["user_id"],
    user: json["user"],
    userImageUrl: json["userImageURL"],
  );

  late final int id;
  late final String pageUrl;
  late final String type;
  late final String tags;
  late final int duration;
  late final String pictureId;
  late final int views;
  late final int downloads;
  late final int likes;
  late final int comments;
  late final int userId;
  late final String user;
  late final String userImageUrl;

  Map<String, dynamic> toJson() => {
    "id": id,
    "pageURL": pageUrl,
    "type": type,
    "tags": tags,
    "duration": duration,
    "picture_id": pictureId,
    "views": views,
    "downloads": downloads,
    "likes": likes,
    "comments": comments,
    "user_id": userId,
    "user": user,
    "userImageURL": userImageUrl,
  };

  // 기존엔 해시코드가 같아야 같은 값으로 보지만
  // id 가 동일하면 같은 값으로 보기로 재정의
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Photo && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Photo{id: $id}';
  }
}
