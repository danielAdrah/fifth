// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) => LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
    String username;
    int id;
    String image;
    Tokens tokens;

    LogInModel({
        required this.username,
        required this.id,
        required this.image,
        required this.tokens,
    });

    factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        username: json["username"],
        id: json["id"],
        image: json["image"],
        tokens: Tokens.fromJson(json["tokens"]),
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "image": image,
        "tokens": tokens.toJson(),
    };
}

class Tokens {
    String refresh;
    String access;

    Tokens({
        required this.refresh,
        required this.access,
    });

    factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refresh: json["refresh"],
        access: json["access"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
    };
}
