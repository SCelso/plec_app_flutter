import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    required this.id,
    required this.email,
    required this.nickname,
  });

  String id;
  String email;
  String nickname;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        id: json["_id"],
        email: json["email"],
        nickname: json["nickname"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "nickname": nickname,
      };
}
