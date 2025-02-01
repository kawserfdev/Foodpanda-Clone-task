// To parse this JSON data, do
//
//     final foodItemByMenuModel = foodItemByMenuModelFromJson(jsonString);

import 'dart:convert';

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

class Food {
  int? foodId;
  String? foodName;
  String? rating;
  String? foodDescription;
  String? foodImage;
  double? foodPrice;
  Currency? currency;

  Food({
    this.foodId,
    this.foodName,
    this.rating,
    this.foodDescription,
    this.foodImage,
    this.foodPrice,
    this.currency,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    foodId: json["FoodId"],
    foodName: json["FoodName"],
    rating: json["Rating"],
    foodDescription: json["FoodDescription"],
    foodImage: json["FoodImage"],
    foodPrice: json["FoodPrice"],
    currency: currencyValues.map[json["Currency"]]!,
  );

  Map<String, dynamic> toJson() => {
    "FoodId": foodId,
    "FoodName": foodName,
    "Rating": rating,
    "FoodDescription": foodDescription,
    "FoodImage": foodImage,
    "FoodPrice": foodPrice,
    "Currency": currencyValues.reverse[currency],
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
