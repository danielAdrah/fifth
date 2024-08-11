// To parse this JSON data, do
//
//     final accountsModel = accountsModelFromJson(jsonString);

import 'dart:convert';

List<AccountsModel> accountsModelFromJson(String str) =>
    List<AccountsModel>.from(
        json.decode(str).map((x) => AccountsModel.fromJson(x)));

String accountsModelToJson(List<AccountsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AccountsModel {
  int id;
  String name;
  String currency;
  String notes;
  int budget;
  int user;

  AccountsModel({
    required this.id,
    required this.name,
    required this.currency,
    required this.notes,
    required this.budget,
    required this.user,
  });

  factory AccountsModel.fromJson(Map<String, dynamic> json) => AccountsModel(
        id: json["id"],
        name: json["name"],
        currency: json["currency"],
        notes: json["notes"],
        budget: json["budget"].toInt(),
        user: json["user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "currency": currency,
        "notes": notes,
        "budget": budget,
        "user": user,
      };
}
