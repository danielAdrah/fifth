// To parse this JSON data, do
//
//     final subPiechartModel = subPiechartModelFromJson(jsonString);

import 'dart:convert';

List<SubPiechartModel> subPiechartModelFromJson(String str) =>
    List<SubPiechartModel>.from(
        json.decode(str).map((x) => SubPiechartModel.fromJson(x)));

String subPiechartModelToJson(List<SubPiechartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubPiechartModel {
  String subcategory;
  double sum;

  SubPiechartModel({
    required this.subcategory,
    required this.sum,
  });

  factory SubPiechartModel.fromJson(Map<String, dynamic> json) =>
      SubPiechartModel(
          subcategory: json["subcategory"],
          sum: (json['sum'] as int).toDouble());

  Map<String, dynamic> toJson() => {
        "subcategory": subcategory,
        "sum": sum,
      };
}
