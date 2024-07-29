// To parse this JSON data, do
//
//     final subcategories = subcategoriesFromJson(jsonString);

import 'dart:convert';

List<Subcategories> subcategoriesFromJson(String str) => List<Subcategories>.from(json.decode(str).map((x) => Subcategories.fromJson(x)));

String subcategoriesToJson(List<Subcategories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Subcategories {
    int id;
    String name;
    DateTime created;
    int category;

    Subcategories({
        required this.id,
        required this.name,
        required this.created,
        required this.category,
    });

    factory Subcategories.fromJson(Map<String, dynamic> json) => Subcategories(
        id: json["id"],
        name: json["name"],
        created: DateTime.parse(json["created"]),
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created": created.toIso8601String(),
        "category": category,
    };
}
