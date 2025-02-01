import 'package:foodapptask/model/fooditem_by_menu_model.dart';

class MenuWithFood {
  String menuName;
  List<Food> foodList;

  MenuWithFood({
    required this.menuName,
    required this.foodList,
  });

  @override
  String toString() {
    return 'MenuWithFood(menuName: $menuName, foodList: ${foodList.length} items)';
  }
}
