// To parse this JSON data, do
//
//     final testModel = testModelFromJson(jsonString);

import 'dart:convert';

TestModel testModelFromJson(String str) => TestModel.fromJson(json.decode(str));

String testModelToJson(TestModel data) => json.encode(data.toJson());

class TestModel {
  int? id;
  String? name;
  String? value;
  String? image;

  TestModel({
    this.id,
    this.name,
    this.value,
    this.image,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => TestModel(
        id: json["id"],
        name: json["name"],
        value: json["value"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "value": value,
        "image": image,
      };
}

/// >> Model for Activity Graph >>

TestGraphModel testGraphModelFromJson(String str) =>
    TestGraphModel.fromJson(json.decode(str));

String testGraphModelToJson(TestGraphModel data) => json.encode(data.toJson());

class TestGraphModel {
  List<GraphData>? data;

  TestGraphModel({
    this.data,
  });

  factory TestGraphModel.fromJson(Map<String, dynamic> json) => TestGraphModel(
        data: json["data"] == null
            ? []
            : List<GraphData>.from(
                json["data"]!.map((x) => GraphData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GraphData {
  String? name;
  int? value;

  GraphData({
    this.name,
    this.value,
  });

  factory GraphData.fromJson(Map<String, dynamic> json) => GraphData(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "data": value,
      };
}
