import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../helpers/api/apis.dart';
import '../model/food_menu_model.dart';
import '../model/restaurant_info_model.dart';
import 'package:http/http.dart' as http;

// final productProvider =
// FutureProvider.family<ProductItem, int>((ref, id) async {
//   return await ProductsService.fetchProductById(id);
// });

final restaurantInfoProvider = FutureProvider<RestaurantInfoModel>((ref) async {
  return await RestaurantService.fetchRestaurantInfo();
});

final restaurantFoodMenuProvider = FutureProvider<RestaurantFoodMenuModel>((ref) async {
  return await RestaurantService.fetchFoodMenu();
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
      throw Exception('Failed to load products');
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
      throw Exception('Failed to load products');
    }
  }

}