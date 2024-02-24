// To parse this JSON data, do
//
//     final getListDataModel = getListDataModelFromJson(jsonString);

import 'dart:convert';

List<GetListDataModel> getListDataModelFromJson(String str) => List<GetListDataModel>.from(json.decode(str).map((x) => GetListDataModel.fromJson(x)));

String getListDataModelToJson(List<GetListDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetListDataModel {
  String id;
  String name;
  String roll;
  String marks;

  GetListDataModel({
    required this.id,
    required this.name,
    required this.roll,
    required this.marks,
  });

  factory GetListDataModel.fromJson(Map<String, dynamic> json) => GetListDataModel(
    id: json["id"],
    name: json["name"],
    roll: json["roll"],
    marks: json["marks"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "roll": roll,
    "marks": marks,
  };
}
