// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

import 'dart:convert';

List<ExpenseModel> expenseModelFromJson(String str) => List<ExpenseModel>.from(json.decode(str).map((x) => ExpenseModel.fromJson(x)));

String expenseModelToJson(List<ExpenseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpenseModel {
    int id;
    String itemName;
    int price;
    DateTime created;
    int account;
    int subcategory;

    ExpenseModel({
        required this.id,
        required this.itemName,
        required this.price,
        required this.created,
        required this.account,
        required this.subcategory,
    });

    factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json["id"],
        itemName: json["item_name"],
        price: json["price"],
        created: DateTime.parse(json["created"]),
        account: json["account"],
        subcategory: json["subcategory"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item_name": itemName,
        "price": price,
        "created": created.toIso8601String(),
        "account": account,
        "subcategory": subcategory,
    };
}
