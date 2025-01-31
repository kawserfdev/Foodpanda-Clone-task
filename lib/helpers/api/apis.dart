class APIs {
  static const baseUrl = "https://demo-api.devdata.top/api";
  static const restaurantInfo = "$baseUrl/RestaurantInfo/GetRestaurantInfo";
  static const restaurantOffer = "$baseUrl/RestaurantInfo/GetRestaurantOffer";
  static const restaurantMenuItem =
      "$baseUrl/RestaurantInfo/GetRestaurantMenuItem";
  static String restaurantFoodItemByMenuId(String id) {
    return "$baseUrl/RestaurantInfo/GetRestaurantFoodItemByMenuId?menuId=$id";
  }

  static String restaurantFoodByFoodId(String id) {
    return "$baseUrl/https://demo-api.devdata.top/api/RestaurantInfo/GetRestaurantFoodByFoodId?foodId=$id";
  }
}

class APIHeader {
  static Map<String, String> getHeader() {
    return {'Content-Type': 'application/json'};
  }
}
