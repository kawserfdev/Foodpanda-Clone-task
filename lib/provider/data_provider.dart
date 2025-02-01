import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapptask/model/food_model.dart';
import 'package:foodapptask/model/fooditem_by_menu_model.dart';
import 'package:foodapptask/model/restaurant_offer_model.dart';

import '../helpers/api/apis.dart';
import '../model/food_menu_model.dart';
import '../model/restaurant_info_model.dart';
import 'package:http/http.dart' as http;



final restaurantInfoProvider = FutureProvider<RestaurantInfoModel>((ref) async {
  return await RestaurantService.fetchRestaurantInfo();
});

final restaurantFoodMenuProvider = FutureProvider<RestaurantFoodMenuModel>((ref) async {
  return await RestaurantService.fetchFoodMenu();
});

final estaurantOfferProvider = FutureProvider<RestaurantOfferModel>((ref) async {
  return await RestaurantService.fetchRestaurantOffer();
});

final foodItemByMenuProvider =
FutureProvider.family<FoodItemByMenuModel, int>((ref, id) async {
  return await RestaurantService.fetchFoodItemByMenu(id);
});

final foodByFoodProvider =
FutureProvider.family<FoodByFoodModel, int>((ref, id) async {
  return await RestaurantService.fetchFoodByFood(id);
});




class RestaurantService {
  // Fetch Restaurant Info
  static Future<RestaurantInfoModel> fetchRestaurantInfo() async {
    print("Restaurant Info URL:${APIs.restaurantInfo}");
    final response = await http.get(Uri.parse(APIs.restaurantInfo),
        headers: APIHeader.getHeader());
    if (response.statusCode == 200) {
      return RestaurantInfoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load info');
    }
  }



    // Fetch Restaurant Food Menu
  static Future<RestaurantFoodMenuModel> fetchFoodMenu() async {
    print("Restaurant Food Menu URL:${APIs.restaurantMenuItem}");
    final response = await http.get(Uri.parse(APIs.restaurantMenuItem),
        headers: APIHeader.getHeader());
    if (response.statusCode == 200) {
      return RestaurantFoodMenuModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load menu');
    }
  }

    // Fetch Restaurant offer
  static Future<RestaurantOfferModel> fetchRestaurantOffer() async {
    print("Restaurant Offer URL:${APIs.restaurantOffer}");
    final response = await http.get(Uri.parse(APIs.restaurantOffer),
        headers: APIHeader.getHeader());
    if (response.statusCode == 200) {
      return RestaurantOfferModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load offers');
    }
  }

      // Fetch Food Item By menu
  static Future<FoodItemByMenuModel> fetchFoodItemByMenu(int id) async {
    print("Restaurant Food Item By menu URL:${APIs.restaurantFoodItemByMenuId(id)}");
    final response = await http.get(Uri.parse(APIs.restaurantFoodItemByMenuId(id)),
        headers: APIHeader.getHeader());
    if (response.statusCode == 200) {
      return FoodItemByMenuModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load menu');
    }
  }

        // Fetch Food By Food Id

  static Future<FoodByFoodModel> fetchFoodByFood(int id) async {
    print("Restaurant Food Item By Food Id URL:${APIs.restaurantFoodByFoodId(id)}");
    final response = await http.get(Uri.parse(APIs.restaurantFoodByFoodId(id)),
        headers: APIHeader.getHeader());
    if (response.statusCode == 200) {
      return FoodByFoodModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load food by food id');
    }
  }

}