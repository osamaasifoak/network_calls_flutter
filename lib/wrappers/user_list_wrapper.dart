import 'dart:convert';

class UserListWrapper {
  UserListWrapper({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
  });

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<UserLisData>? data;

  factory UserListWrapper.fromRawJson(String str) =>
      UserListWrapper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserListWrapper.fromJson(Map<String, dynamic> json) =>
      UserListWrapper(
        page: json["page"] == null ? null : json["page"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        total: json["total"] == null ? null : json["total"],
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        data: json["data"] == null
            ? null
            : List<UserLisData>.from(
                json["data"].map((x) => UserLisData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "per_page": perPage == null ? null : perPage,
        "total": total == null ? null : total,
        "total_pages": totalPages == null ? null : totalPages,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class UserLisData {
  UserLisData({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  factory UserLisData.fromRawJson(String str) =>
      UserLisData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserLisData.fromJson(Map<String, dynamic> json) => UserLisData(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "avatar": avatar == null ? null : avatar,
      };
}
