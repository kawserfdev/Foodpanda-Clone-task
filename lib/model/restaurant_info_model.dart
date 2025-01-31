// To parse this JSON data, do
//
//     final restaurantInfoModel = restaurantInfoModelFromJson(jsonString);

import 'dart:convert';

RestaurantInfoModel restaurantInfoModelFromJson(String str) => RestaurantInfoModel.fromJson(json.decode(str));

String restaurantInfoModelToJson(RestaurantInfoModel data) => json.encode(data.toJson());

  class RestaurantInfoModel {
  int? status;
  String? message;
  Data? data;

  RestaurantInfoModel({
    this.status,
    this.message,
    this.data,
  });

  factory RestaurantInfoModel.fromJson(Map<String, dynamic> json) => RestaurantInfoModel(
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
  String? name;
  String? profileImageUrl;
  String? averageDeliveryTime;
  String? averageRating;
  String? totalRating;
  int? minOrderAmount;
  String? currency;
  String? deliveryMode;
  String? distance;

  Data({
    this.name,
    this.profileImageUrl,
    this.averageDeliveryTime,
    this.averageRating,
    this.totalRating,
    this.minOrderAmount,
    this.currency,
    this.deliveryMode,
    this.distance,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["Name"],
    profileImageUrl: json["ProfileImageUrl"],
    averageDeliveryTime: json["AverageDeliveryTime"],
    averageRating: json["AverageRating"],
    totalRating: json["TotalRating"],
    minOrderAmount: json["MinOrderAmount"],
    currency: json["Currency"],
    deliveryMode: json["DeliveryMode"],
    distance: json["Distance"],
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "ProfileImageUrl": profileImageUrl,
    "AverageDeliveryTime": averageDeliveryTime,
    "AverageRating": averageRating,
    "TotalRating": totalRating,
    "MinOrderAmount": minOrderAmount,
    "Currency": currency,
    "DeliveryMode": deliveryMode,
    "Distance": distance,
  };
}
