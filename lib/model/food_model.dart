// To parse this JSON data, do
//
//     final foodByFoodModel = foodByFoodModelFromJson(jsonString);

import 'dart:convert';

FoodByFoodModel foodByFoodModelFromJson(String str) => FoodByFoodModel.fromJson(json.decode(str));

String foodByFoodModelToJson(FoodByFoodModel data) => json.encode(data.toJson());

class FoodByFoodModel {
  int? status;
  String? message;
  Data? data;

  FoodByFoodModel({
    this.status,
    this.message,
    this.data,
  });

  factory FoodByFoodModel.fromJson(Map<String, dynamic> json) => FoodByFoodModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int? foodId;
  String? foodName;
  String? foodImage;
  double? foodPrice;
  String? foodDescription;
  bool? isShowVariant;
  String? currency;

  Data({
    this.foodId,
    this.foodName,
    this.foodImage,
    this.foodPrice,
    this.foodDescription,
    this.isShowVariant,
    this.currency,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    foodId: json["FoodId"],
    foodName: json["FoodName"],
    foodImage: json["FoodImage"],
    foodPrice: json["FoodPrice"],
    foodDescription: json["FoodDescription"],
    isShowVariant: json["IsShowVariant"],
    currency: json["Currency"],
  );

  Map<String, dynamic> toJson() => {
    "FoodId": foodId,
    "FoodName": foodName,
    "FoodImage": foodImage,
    "FoodPrice": foodPrice,
    "FoodDescription": foodDescription,
    "IsShowVariant": isShowVariant,
    "Currency": currency,
  };
}
