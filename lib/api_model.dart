// To parse this JSON data, do
//
//     final sampleModel = sampleModelFromJson(jsonString);

import 'dart:convert';

List<SampleModel> sampleModelFromJson(String str) => List<SampleModel>.from(json.decode(str).map((x) => SampleModel.fromJson(x)));

String sampleModelToJson(List<SampleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleModel {
  int userId;
  int id;
  String title;
  String body;

  SampleModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory SampleModel.fromJson(Map<String, dynamic> json) => SampleModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
