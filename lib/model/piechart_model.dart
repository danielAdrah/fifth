// To parse this JSON data, do
//
//     final piechartModel = piechartModelFromJson(jsonString);

import 'dart:convert';

List<PiechartModel> piechartModelFromJson(String str) => List<PiechartModel>.from(json.decode(str).map((x) => PiechartModel.fromJson(x)));

String piechartModelToJson(List<PiechartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PiechartModel {
    String category;
    int sum;

    PiechartModel({
        required this.category,
        required this.sum,
    });

    factory PiechartModel.fromJson(Map<String, dynamic> json) => PiechartModel(
        category: json["category"],
        sum: json["sum"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "sum": sum,
    };
}
