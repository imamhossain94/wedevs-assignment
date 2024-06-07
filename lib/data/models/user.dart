import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.nickname,
    this.avatarUrls,
  });

  int? id;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? nickname;
  Map<String, String>? avatarUrls;

  String fullName() => "$firstName $lastName";

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        nickname: json["nickname"],
        avatarUrls: Map.from(json["avatar_urls"]).map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "nickname": nickname,
        "avatar_urls": Map.from(avatarUrls!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
