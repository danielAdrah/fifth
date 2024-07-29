// To parse this JSON data, do
//
//     final limitModel = limitModelFromJson(jsonString);

import 'dart:convert';

LimitModel limitModelFromJson(String str) => LimitModel.fromJson(json.decode(str));

String limitModelToJson(LimitModel data) => json.encode(data.toJson());

class LimitModel {
    int id;
    int limit;
    DateTime startDate;
    DateTime endDate;
    String currency;
    int user;
    int category;

    LimitModel({
        required this.id,
        required this.limit,
        required this.startDate,
        required this.endDate,
        required this.currency,
        required this.user,
        required this.category,
    });

    factory LimitModel.fromJson(Map<String, dynamic> json) => LimitModel(
        id: json["id"],
        limit: json["limit"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        currency: json["currency"],
        user: json["user"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "limit": limit,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currency": currency,
        "user": user,
        "category": category,
    };
}
