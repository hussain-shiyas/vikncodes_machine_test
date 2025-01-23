// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
  final int? success;
  final Data? data;
  final int? userId;
  final String? role;
  final String? message;
  final String? error;
  final String? username;

  LoginResModel({
    this.success,
    this.data,
    this.userId,
    this.role,
    this.message,
    this.error,
    this.username,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    userId: json["user_id"],
    role: json["role"],
    message: json["message"],
    error: json["error"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data?.toJson(),
    "user_id": userId,
    "role": role,
    "message": message,
    "error": error,
    "username": username,
  };
}

class Data {
  final String? refresh;
  final String? access;
  final int? userId;
  final String? role;
  final String? username;
  final String? email;
  final String? lastLogin;

  Data({
    this.refresh,
    this.access,
    this.userId,
    this.role,
    this.username,
    this.email,
    this.lastLogin,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    refresh: json["refresh"],
    access: json["access"],
    userId: json["user_id"],
    role: json["role"],
    username: json["username"],
    email: json["email"],
    lastLogin: json["last_login"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
    "user_id": userId,
    "role": role,
    "username": username,
    "email": email,
    "last_login": lastLogin,
  };
}
