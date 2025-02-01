import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapptask/constants/app_constants.dart';
import 'package:foodapptask/provider/state_change.dart';
import 'package:foodapptask/views/widget/custom_network_image.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';
import '../provider/data_provider.dart';


class RestaurantMenuPage extends ConsumerStatefulWidget {
  const RestaurantMenuPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantMenuPageState();
}

class _RestaurantMenuPageState extends ConsumerState<RestaurantMenuPage>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late ItemScrollController _itemScrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _itemScrollController= ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantInfoRef = ref.watch(restaurantInfoProvider);
    final menuStateNotifier = ref.watch(restaurantStateProvider);

    if (menuStateNotifier.menuList.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No menu available")),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 280.h,
            pinned: true,
            backgroundColor: AppColors.whiteColor,
            flexibleSpace: FlexibleSpaceBar(
              background: restaurantInfoRef.when(
                data: (restaurant) {
                  return Column(
                    children: [
                      CustomNetworkImgWidget(
                        imageUrl: restaurant.data?.profileImageUrl ?? "",
                        width: double.infinity,
                        heigth: 208.h,
                      ),
                      // Your restaurant info UI
                    ],
                  );
                },
                error: (error, stackTrace) {
                  return Center(child: Text("$error"));
                },
                loading: () => Center(child: CircularProgressIndicator()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ScrollableListTabScroller(
              itemScrollController: _itemScrollController, // Use same controller
              itemCount: menuStateNotifier.menuWithFoodList.length,
              tabBuilder: (BuildContext context, int index, bool active) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  menuStateNotifier.menuWithFoodList[index].menuName,
                  style: active ? TextStyle(fontWeight: FontWeight.bold, color: Colors.green) : null,
                ),
              ),
              itemBuilder: (BuildContext context, int index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      menuStateNotifier.menuWithFoodList[index].menuName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  ...menuStateNotifier.menuWithFoodList[index].foodList.map(
                        (food) => ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                        alignment: Alignment.center,
                        child: Text(food.foodName?.substring(0, 1) ?? ""),
                      ),
                      title: Text(food.foodName ?? ""),
                    ),
                  ).toList(),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}



/*SliverAppBar(
                expandedHeight: 280.h,
                pinned: true,
                backgroundColor: AppColors.whiteColor,
                flexibleSpace: FlexibleSpaceBar(
                  background: restaurantInfoRef.when(
                    data: (restaurant) {
                      return Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              CustomNetworkImgWidget(
                                imageUrl: restaurant.data?.profileImageUrl ?? "",
                                width: double.infinity,
                                heigth: 208.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 24.h),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.arrow_back,
                                          color: AppColors.whiteColor),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(CupertinoIcons.heart,
                                          color: AppColors.whiteColor),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(CupertinoIcons.search,
                                          color: AppColors.whiteColor),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.more_vert_outlined,
                                          color: AppColors.whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 190.h),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16.r),
                                    topLeft: Radius.circular(16.r),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "${restaurant.data?.name ?? "Unknown Restaurant"} ⓘ",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "🚚 Delivery 15-25 mins  •  📍 2 km Away",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black54),
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "❤️ Free delivery  •  Min order 30 AED",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(child: Text("$error"));
                    },
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),*/