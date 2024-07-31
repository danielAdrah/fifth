// To parse this JSON data, do
//
//     final limitsModel = limitsModelFromJson(jsonString);

import 'dart:convert';

List<LimitsModel> limitsModelFromJson(String str) => List<LimitsModel>.from(json.decode(str).map((x) => LimitsModel.fromJson(x)));

String limitsModelToJson(List<LimitsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LimitsModel {
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

    LimitsModel({
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

    factory LimitsModel.fromJson(Map<String, dynamic> json) => LimitsModel(
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
