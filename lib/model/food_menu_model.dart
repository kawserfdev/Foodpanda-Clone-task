// To parse this JSON data, do
//
//     final restaurantFoodMenuModel = restaurantFoodMenuModelFromJson(jsonString);

import 'dart:convert';

RestaurantFoodMenuModel restaurantFoodMenuModelFromJson(String str) => RestaurantFoodMenuModel.fromJson(json.decode(str));

String restaurantFoodMenuModelToJson(RestaurantFoodMenuModel data) => json.encode(data.toJson());

class RestaurantFoodMenuModel {
  int? status;
  String? message;
  List<Menus>? data;

  RestaurantFoodMenuModel({
    this.status,
    this.message,
    this.data,
  });

  factory RestaurantFoodMenuModel.fromJson(Map<String, dynamic> json) => RestaurantFoodMenuModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Menus>.from(json["data"]!.map((x) => Menus.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Menus {
  int? menuId;
  String? menuName;

  Menus({
    this.menuId,
    this.menuName,
  });

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    menuId: json["menuId"],
    menuName: json["MenuName"],
  );

  Map<String, dynamic> toJson() => {
    "menuId": menuId,
    "MenuName": menuName,
  };
}
