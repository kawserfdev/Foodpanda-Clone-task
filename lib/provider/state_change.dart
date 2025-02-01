import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foodapptask/model/loaded_food_model.dart';

import '../model/food_menu_model.dart';
import '../provider/data_provider.dart';

class RestaurantMenuNotifier extends ChangeNotifier {
  List<MenuWithFood> menuWithFoodList = [];
  List<Menus> menuList = [];
  int activeMenuIndex = 0;
  int menuId = 1;
  String? _menuName;

  String get menuName => _menuName ?? "";

  final Ref ref;
  final PageController pageController = PageController();

  RestaurantMenuNotifier(this.ref) {
    _loadMenus(); // Fetch menus on initialization
  }

  Future<void> _loadMenus() async {
    final menuProvider = ref.watch(restaurantFoodMenuProvider);
    if (menuProvider.value?.data != null) {
      menuList = menuProvider.value!.data!;
      menuId = menuList.isNotEmpty ? menuList[0].menuId! : 1;
      _menuName = menuList.isNotEmpty ? menuList[0].menuName : "";
      
      notifyListeners(); 
      await loadFoodForMenu();
    }
  }

  Future<void> loadFoodForMenu() async {
    if (menuList.isEmpty) return;

    menuWithFoodList.clear(); 

    for (var menu in menuList) {
      try {
        final foodProvider = await ref.read(foodItemByMenuProvider(menu.menuId!).future);

        if (foodProvider.data != null) {
          menuWithFoodList.add(
            MenuWithFood(
              menuName: menu.menuName ?? "N/A",
              foodList: foodProvider.data!,
            ),
          );
        }
      } catch (e) {
        print(" Error loading food for ${menu.menuName}: $e");
      }
    }
    notifyListeners();
  }
    /// ✅ Detect last food item and switch menu
  void onFoodScrolled(int index) {
    if (menuWithFoodList.isEmpty) return;

    final currentMenu = menuWithFoodList[activeMenuIndex];
    if (index >= currentMenu.foodList.length - 1) {
      _switchToNextMenu();
    }
  }
  /// ✅ Switch to the next menu when the last item is reached
  void _switchToNextMenu() {
    if (activeMenuIndex < menuList.length - 1) {
      activeMenuIndex += 1;
      menuId = menuList[activeMenuIndex].menuId!;

      notifyListeners(); // ✅ Update UI

      // ✅ Scroll to next menu tab smoothly
      pageController.animateToPage(
        activeMenuIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      // ✅ Load new food items
      ref.refresh(foodItemByMenuProvider(menuId));
    }
  }

  void changeMenu(int index) {
    activeMenuIndex = index;
    menuId = menuList[index].menuId!;
    _menuName = menuList[index].menuName;
    ref.refresh(foodItemByMenuProvider(menuId)); 
    notifyListeners();
  }
}

// Riverpod Provider
final restaurantStateProvider = ChangeNotifierProvider<RestaurantMenuNotifier>(
  (ref) => RestaurantMenuNotifier(ref),
);
