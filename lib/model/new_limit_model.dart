// To parse this JSON data, do
//
//     final newLimitModel = newLimitModelFromJson(jsonString);

import 'dart:convert';

NewLimitModel newLimitModelFromJson(String str) => NewLimitModel.fromJson(json.decode(str));

String newLimitModelToJson(NewLimitModel data) => json.encode(data.toJson());

class NewLimitModel {
    int id;
    String categoryName;
    int currentSpending;
    int remainingAmount;
    int limit;
    DateTime startDate;
    DateTime endDate;
    String currency;
    int user;
    int category;

    NewLimitModel({
        required this.id,
        required this.categoryName,
        required this.currentSpending,
        required this.remainingAmount,
        required this.limit,
        required this.startDate,
        required this.endDate,
        required this.currency,
        required this.user,
        required this.category,
    });

    factory NewLimitModel.fromJson(Map<String, dynamic> json) => NewLimitModel(
        id: json["id"],
        categoryName: json["category_name"],
        currentSpending: json["current_spending"],
        remainingAmount: json["remaining_amount"],
        limit: json["limit"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        currency: json["currency"],
        user: json["user"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "current_spending": currentSpending,
        "remaining_amount": remainingAmount,
        "limit": limit,
        "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "currency": currency,
        "user": user,
        "category": category,
    };
}
