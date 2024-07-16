// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    InformationUser informationUser;
    Tokens tokens;

    SignUpModel({
        required this.informationUser,
        required this.tokens,
    });

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        informationUser: InformationUser.fromJson(json["information_user"]),
        tokens: Tokens.fromJson(json["tokens"]),
    );

    Map<String, dynamic> toJson() => {
        "information_user": informationUser.toJson(),
        "tokens": tokens.toJson(),
    };
}

class InformationUser {
    int id;
    String email;
    String username;

    InformationUser({
        required this.id,
        required this.email,
        required this.username,
    });

    factory InformationUser.fromJson(Map<String, dynamic> json) => InformationUser(
        id: json["id"],
        email: json["email"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
    };
}

class Tokens {
    String refresh;
    String accsess;

    Tokens({
        required this.refresh,
        required this.accsess,
    });

    factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refresh: json["refresh"],
        accsess: json["accsess"],
    );

    Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "accsess": accsess,
    };
}
