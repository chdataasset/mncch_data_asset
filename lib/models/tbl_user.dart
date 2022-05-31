// To parse this JSON data, do
//
//     final modelTbluser = modelTbluserFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';

ModelTbluser modelTbluserFromJson(String str) =>
    ModelTbluser.fromJson(json.decode(str));

String modelTbluserToJson(ModelTbluser data) => json.encode(data.toJson());

class ModelTbluser {
  ModelTbluser({
    required this.id,
    required this.userId,
    required this.username,
    required this.email,
    required this.createdAt,
  });

  int id;
  String userId;
  String username;
  String email;
  String createdAt;

  factory ModelTbluser.fromJson(Map<String, dynamic> json) => ModelTbluser(
        id: json["id"],
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "username": username,
        "email": email,
        "created_at": createdAt,
      };

  static List<ModelTbluser> fromJsonList(List list) {
    if (list == null) return List<ModelTbluser>.empty();
    return list.map((item) => ModelTbluser.fromJson(item)).toList();
  }
}
