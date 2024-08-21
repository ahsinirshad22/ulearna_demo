import 'dart:convert';

class BytesDataModel {
  int? statusCode;
  String? message;
  Data? data;

  BytesDataModel({
    this.statusCode,
    this.message,
    this.data,
  });

  factory BytesDataModel.fromJson(String str) => BytesDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BytesDataModel.fromMap(Map<String, dynamic> json) => BytesDataModel(
    statusCode: json["statusCode"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode,
    "message": message,
    "data": data?.toMap(),
  };
}

class Data {
  List<Datum>? data;
  MetaData? metaData;

  Data({
    this.data,
    this.metaData,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
    metaData: json["meta_data"] == null ? null : MetaData.fromMap(json["meta_data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "meta_data": metaData?.toMap(),
  };
}

class Datum {
  int? id;
  String? title;
  String? url;
  String? cdnUrl;
  String? thumbCdnUrl;
  int? userId;
  String? status;
  String? slug;
  String? encodeStatus;
  int? priority;
  int? categoryId;
  int? totalViews;
  int? totalLikes;
  int? totalComments;
  int? totalShare;
  int? totalWishlist;
  int? duration;
  DateTime? byteAddedOn;
  DateTime? byteUpdatedOn;
  String? bunnyStreamVideoId;
  String? language;
  int? bunnyEncodingStatus;
  dynamic deletedAt;
  User? user;
  bool? isLiked;
  bool? isWished;
  bool? isFollow;

  Datum({
    this.id,
    this.title,
    this.url,
    this.cdnUrl,
    this.thumbCdnUrl,
    this.userId,
    this.status,
    this.slug,
    this.encodeStatus,
    this.priority,
    this.categoryId,
    this.totalViews,
    this.totalLikes,
    this.totalComments,
    this.totalShare,
    this.totalWishlist,
    this.duration,
    this.byteAddedOn,
    this.byteUpdatedOn,
    this.bunnyStreamVideoId,
    this.language,
    this.bunnyEncodingStatus,
    this.deletedAt,
    this.user,
    this.isLiked,
    this.isWished,
    this.isFollow,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    url: json["url"],
    cdnUrl: json["cdn_url"],
    thumbCdnUrl: json["thumb_cdn_url"],
    userId: json["user_id"],
    status: json["status"],
    slug: json["slug"],
    encodeStatus:json["encode_status"],
    priority: json["priority"],
    categoryId: json["category_id"],
    totalViews: json["total_views"],
    totalLikes: json["total_likes"],
    totalComments: json["total_comments"],
    totalShare: json["total_share"],
    totalWishlist: json["total_wishlist"],
    duration: json["duration"],
    byteAddedOn: json["byte_added_on"] == null ? null : DateTime.parse(json["byte_added_on"]),
    byteUpdatedOn: json["byte_updated_on"] == null ? null : DateTime.parse(json["byte_updated_on"]),
    bunnyStreamVideoId: json["bunny_stream_video_id"],
    language: json["language"],
    bunnyEncodingStatus: json["bunny_encoding_status"],
    deletedAt: json["deleted_at"],
    user: json["user"] == null ? null : User.fromMap(json["user"]),
    isLiked: json["is_liked"],
    isWished: json["is_wished"],
    isFollow: json["is_follow"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "url": url,
    "cdn_url": cdnUrl,
    "thumb_cdn_url": thumbCdnUrl,
    "user_id": userId,
    "status":status,
    "slug": slug,
    "encode_status": encodeStatus,
    "priority": priority,
    "category_id": categoryId,
    "total_views": totalViews,
    "total_likes": totalLikes,
    "total_comments": totalComments,
    "total_share": totalShare,
    "total_wishlist": totalWishlist,
    "duration": duration,
    "byte_added_on": byteAddedOn?.toIso8601String(),
    "byte_updated_on": byteUpdatedOn?.toIso8601String(),
    "bunny_stream_video_id": bunnyStreamVideoId,
    "language": language,
    "bunny_encoding_status": bunnyEncodingStatus,
    "deleted_at": deletedAt,
    "user": user?.toMap(),
    "is_liked": isLiked,
    "is_wished": isWished,
    "is_follow": isFollow,
  };
}


class User {
  int? userId;
  String? fullname;
  String? username;
  String? profilePicture;
  String? profilePictureCdn;
  String? designation;

  User({
    this.userId,
    this.fullname,
    this.username,
    this.profilePicture,
    this.profilePictureCdn,
    this.designation,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    userId: json["user_id"],
    fullname: json["fullname"],
    username: json["username"],
    profilePicture: json["profile_picture"],
    profilePictureCdn: json["profile_picture_cdn"],
    designation: json["designation"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": userId,
    "fullname": fullname,
    "username": username,
    "profile_picture": profilePicture,
    "profile_picture_cdn": profilePictureCdn,
    "designation": designation,
  };
}

class MetaData {
  int? total;
  int? page;
  int? limit;

  MetaData({
    this.total,
    this.page,
    this.limit,
  });

  factory MetaData.fromJson(String str) => MetaData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MetaData.fromMap(Map<String, dynamic> json) => MetaData(
    total: json["total"],
    page: json["page"],
    limit: json["limit"],
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "page": page,
    "limit": limit,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
