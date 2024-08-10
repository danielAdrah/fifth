// To parse this JSON data, do
//
//     final upcomingExpenseModel = upcomingExpenseModelFromJson(jsonString);

import 'dart:convert';

List<UpcomingExpenseModel> upcomingExpenseModelFromJson(String str) => List<UpcomingExpenseModel>.from(json.decode(str).map((x) => UpcomingExpenseModel.fromJson(x)));

String upcomingExpenseModelToJson(List<UpcomingExpenseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UpcomingExpenseModel {
    int id;
    String name;
    int price;
    String created;
    DateTime date;
    int user;
    int subcategory;

    UpcomingExpenseModel({
        required this.id,
        required this.name,
        required this.price,
        required this.created,
        required this.date,
        required this.user,
        required this.subcategory,
    });

    factory UpcomingExpenseModel.fromJson(Map<String, dynamic> json) => UpcomingExpenseModel(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        created: json["created"],
        date: DateTime.parse(json["date"]),
        user: json["user"],
        subcategory: json["subcategory"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "created": created,
        "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "user": user,
        "subcategory": subcategory,
    };
}
