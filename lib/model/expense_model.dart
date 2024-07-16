// To parse this JSON data, do
//
//     final expenseModel = expenseModelFromJson(jsonString);

import 'dart:convert';

List<ExpenseModel> expenseModelFromJson(String str) => List<ExpenseModel>.from(json.decode(str).map((x) => ExpenseModel.fromJson(x)));

String expenseModelToJson(List<ExpenseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExpenseModel {
    int id;
    int totalPrice;
    String user;
    String expenseName;
    String itemName;
    int quantity;
    int price;
    DateTime timePurchased;

    ExpenseModel({
        required this.id,
        required this.totalPrice,
        required this.user,
        required this.expenseName,
        required this.itemName,
        required this.quantity,
        required this.price,
        required this.timePurchased,
    });

    factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        id: json["id"],
        totalPrice: json["total_price"],
        user: json["user"],
        expenseName: json["expense_name"],
        itemName: json["item_name"],
        quantity: json["quantity"],
        price: json["price"],
        timePurchased: DateTime.parse(json["time_purchased"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "total_price": totalPrice,
        "user": user,
        "expense_name": expenseName,
        "item_name": itemName,
        "quantity": quantity,
        "price": price,
        "time_purchased": timePurchased.toIso8601String(),
    };
}
