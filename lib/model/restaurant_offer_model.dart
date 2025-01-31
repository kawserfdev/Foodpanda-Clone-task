// To parse this JSON data, do
//
//     final restaurantOfferModel = restaurantOfferModelFromJson(jsonString);

import 'dart:convert';

RestaurantOfferModel restaurantOfferModelFromJson(String str) => RestaurantOfferModel.fromJson(json.decode(str));

String restaurantOfferModelToJson(RestaurantOfferModel data) => json.encode(data.toJson());

class RestaurantOfferModel {
  int? status;
  String? message;
  List<Offers>? data;

  RestaurantOfferModel({
    this.status,
    this.message,
    this.data,
  });

  factory RestaurantOfferModel.fromJson(Map<String, dynamic> json) => RestaurantOfferModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Offers>.from(json["data"]!.map((x) => Offers.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Offers {
  String? discount;
  String? discountType;
  int? minimumOrderAmount;
  String? deliveryMode;

  Offers({
    this.discount,
    this.discountType,
    this.minimumOrderAmount,
    this.deliveryMode,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
    discount: json["Discount"],
    discountType: json["DiscountType"],
    minimumOrderAmount: json["MinimumOrderAmount"],
    deliveryMode: json["DeliveryMode"],
  );

  Map<String, dynamic> toJson() => {
    "Discount": discount,
    "DiscountType": discountType,
    "MinimumOrderAmount": minimumOrderAmount,
    "DeliveryMode": deliveryMode,
  };
}
