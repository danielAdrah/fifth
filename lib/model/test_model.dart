// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

List<TestModel> testModelFromJson(String str) => List<TestModel>.from(json.decode(str).map((x) => TestModel.fromJson(x)));

String testModelToJson(List<TestModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestModel {
    int id;
    String image;
    String username;
    DateTime created;
    int user;

    TestModel({
        required this.id,
        required this.image,
        required this.username,
        required this.created,
        required this.user,
    });

    factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json["id"],
        image: json["image"],
        username: json["username"],
        created: DateTime.parse(json["created"]),
        user: json["user"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "username": username,
        "created": created.toIso8601String(),
        "user": user,
    };
}
