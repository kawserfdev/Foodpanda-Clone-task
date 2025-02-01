// To parse this JSON data, do
//
//     final foodItemByMenuModel = foodItemByMenuModelFromJson(jsonString);

import 'dart:convert';

import 'food_model.dart';

FoodItemByMenuModel foodItemByMenuModelFromJson(String str) => FoodItemByMenuModel.fromJson(json.decode(str));

String foodItemByMenuModelToJson(FoodItemByMenuModel data) => json.encode(data.toJson());

class FoodItemByMenuModel {
  int? status;
  String? message;
  List<Food>? data;

  FoodItemByMenuModel({
    this.status,
    this.message,
    this.data,
  });

  factory FoodItemByMenuModel.fromJson(Map<String, dynamic> json) => FoodItemByMenuModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Food>.from(json["data"]!.map((x) => Food.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

enum Currency {
  AED
}

final currencyValues = EnumValues({
  "AED": Currency.AED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
