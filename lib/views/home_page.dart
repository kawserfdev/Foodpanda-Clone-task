// import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:foodapptask/constants/app_constants.dart';
// import 'package:foodapptask/model/food_menu_model.dart';
// import 'package:foodapptask/provider/state_change.dart';
// import 'package:foodapptask/views/widget/custom_network_image.dart';

// import '../provider/data_provider.dart';

// class RestaurantMenuPage extends ConsumerStatefulWidget {
//   const RestaurantMenuPage({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _RestaurantMenuPageState();
// }

// class _RestaurantMenuPageState extends ConsumerState<RestaurantMenuPage> {
//   @override
//   Widget build(BuildContext context) {
//     final restaurantInfoRef = ref.watch(restaurantInfoProvider);
//     final menuStateNotifier = ref.watch(restaurantStateProvider);
//     final menuItemsRef =
//         ref.watch(foodItemByMenuProvider(menuStateNotifier.menuId));

//     return Scaffold(
//       body: CustomScrollView(slivers: [
//         SliverToBoxAdapter(
//           child: restaurantInfoRef.when(
//             data: (restaurant) {
//               return Stack(
//                 clipBehavior: Clip.none,
//                 children: [
//                   CustomNetworkImgWidget(
//                       imageUrl: restaurant.data?.profileImageUrl ?? "",
//                       width: double.infinity,
//                       heigth: 208.h),
//                   Padding(
//                     padding: EdgeInsets.only(top: 24.h),
//                     child: Row(
//                       children: [
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.arrow_back,
//                               color: AppColors.whiteColor,
//                             )),
//                         Spacer(),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               CupertinoIcons.heart,
//                               color: AppColors.whiteColor,
//                             )),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               CupertinoIcons.search,
//                               color: AppColors.whiteColor,
//                             )),
//                         IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.more_vert_outlined,
//                               color: AppColors.whiteColor,
//                             ))
//                       ],
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(top: 190.h),
//                     decoration: BoxDecoration(
//                         color: AppColors.whiteColor,
//                         borderRadius: BorderRadius.only(
//                             topRight: Radius.circular(16.r),
//                             topLeft: Radius.circular(16.r))),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(16),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.stretch,
//                             children: [
//                               Text(
//                                 "${restaurant.data?.name ?? "UnKnown Restaurant"} ⓘ",
//                                 style: TextStyle(
//                                     fontSize: 22, fontWeight: FontWeight.bold),
//                               ),
//                               const SizedBox(height: 5),
//                               const Text(
//                                 "🚚 Delivery 15-25 mins  •  📍 2 km Away",
//                                 style: TextStyle(
//                                     fontSize: 14, color: Colors.black54),
//                               ),
//                               const SizedBox(height: 5),
//                               const Text(
//                                 "❤️ Free delivery  •  Min order 30 AED",
//                                 style:
//                                     TextStyle(fontSize: 14, color: Colors.red),
//                               ),
//                             ],
//                           ),
//                         ),

//                         // Discount Banners
//                         Row(
//                           children: [
//                             Expanded(
//                               child: Container(
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   color: Colors.pink.withOpacity(0.2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Text("20% off",
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.pink)),
//                                     Text("Up to 300 AED",
//                                         style: const TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.black54)),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//                             Expanded(
//                               child: Container(
//                                 padding: const EdgeInsets.all(12),
//                                 decoration: BoxDecoration(
//                                   color: Colors.pink.withOpacity(0.2),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Text("20% off",
//                                         style: TextStyle(
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.orange)),
//                                     Text("Up to 300 AED",
//                                         style: const TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.black54)),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(height: 15),
//                         // Category Chips
//                         SizedBox(
//                           height: 40,
//                           child: ListView.builder(
//                             controller: menuStateNotifier
//                                 .pageController, // ✅ Attach controller
//                             scrollDirection: Axis.horizontal,
//                             itemCount: menuStateNotifier.menuList.length,
//                             itemBuilder: (context, index) {
//                               final item = menuStateNotifier.menuList[index];
//                               bool isSelected =
//                                   index == menuStateNotifier.activeMenuIndex;

//                               return GestureDetector(
//                                 onTap: () => ref
//                                     .read(restaurantStateProvider.notifier)
//                                     .changeMenu(index),
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(right: 8.0),
//                                   child: Chip(
//                                     label: Text(
//                                       item.menuName ?? "N/A",
//                                       style: TextStyle(
//                                         color: isSelected
//                                             ? Colors.white
//                                             : Colors.black,
//                                         fontWeight: isSelected
//                                             ? FontWeight.bold
//                                             : FontWeight.normal,
//                                       ),
//                                     ),
//                                     backgroundColor: isSelected
//                                         ? Colors.pink
//                                         : Colors.grey[200],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 15),

//                         // SizedBox(
//                         //   child: Consumer(
//                         //     builder: (context, ref, child) {
//                         //       final menuStateNotifier =
//                         //           ref.watch(restaurantStateProvider);

//                         //       print(
//                         //           "Current MenuWithFood List: ${menuStateNotifier.menuWithFoodList}"); // ✅ Debugging

//                         //       return ListView.builder(
//                         //         shrinkWrap: true,
//                         //         physics: const NeverScrollableScrollPhysics(),
//                         //         itemCount:
//                         //             menuStateNotifier.menuWithFoodList.length,
//                         //         itemBuilder: (context, index) {
//                         //           final menuWithFood =
//                         //               menuStateNotifier.menuWithFoodList[index];

//                         //           return Column(
//                         //             crossAxisAlignment:
//                         //                 CrossAxisAlignment.start,
//                         //             children: [
//                         //               Padding(
//                         //                 padding: const EdgeInsets.all(8.0),
//                         //                 child: Text(
//                         //                   menuWithFood.menuName,
//                         //                   style: const TextStyle(
//                         //                       fontSize: 18,
//                         //                       fontWeight: FontWeight.bold),
//                         //                 ),
//                         //               ),
//                         //               ...menuWithFood.foodList.map((food) {
//                         //                 return Card(
//                         //                   elevation: 1,
//                         //                   shape: RoundedRectangleBorder(
//                         //                       borderRadius:
//                         //                           BorderRadius.circular(10)),
//                         //                   child: Padding(
//                         //                     padding: const EdgeInsets.all(12.0),
//                         //                     child: Row(
//                         //                       children: [
//                         //                         ClipRRect(
//                         //                           borderRadius:
//                         //                               BorderRadius.circular(8),
//                         //                           child: Image.network(
//                         //                             food.foodImage ?? "",
//                         //                             width: 70,
//                         //                             height: 70,
//                         //                             fit: BoxFit.cover,
//                         //                           ),
//                         //                         ),
//                         //                         const SizedBox(width: 12),
//                         //                         Expanded(
//                         //                           child: Column(
//                         //                             crossAxisAlignment:
//                         //                                 CrossAxisAlignment
//                         //                                     .start,
//                         //                             children: [
//                         //                               Text(
//                         //                                 food.foodName ?? "",
//                         //                                 style: const TextStyle(
//                         //                                     fontSize: 16,
//                         //                                     fontWeight:
//                         //                                         FontWeight
//                         //                                             .bold),
//                         //                               ),
//                         //                               const SizedBox(height: 5),
//                         //                               Text(
//                         //                                 food.foodDescription ??
//                         //                                     "",
//                         //                                 style: const TextStyle(
//                         //                                     fontSize: 12,
//                         //                                     color:
//                         //                                         Colors.black54),
//                         //                                 maxLines: 2,
//                         //                                 overflow: TextOverflow
//                         //                                     .ellipsis,
//                         //                               ),
//                         //                             ],
//                         //                           ),
//                         //                         ),
//                         //                       ],
//                         //                     ),
//                         //                   ),
//                         //                 );
//                         //               }).toList(),
//                         //             ],
//                         //           );
//                         //         },
//                         //       );
//                         //     },
//                         //   ),

//                         // ),
//                         SizedBox(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             controller: ScrollController(),
//                             itemCount:
//                                 menuStateNotifier.menuWithFoodList.isEmpty
//                                     ? 0
//                                     : menuStateNotifier
//                                         .menuWithFoodList[
//                                             menuStateNotifier.activeMenuIndex]
//                                         .foodList
//                                         .length,
//                             itemBuilder: (context, index) {
//                               final menuWithFood =
//                                   menuStateNotifier.menuWithFoodList[
//                                       menuStateNotifier.activeMenuIndex];
//                               final food = menuWithFood.foodList[index];

//                               // ✅ Detect when last item is reached
//                               if (index == menuWithFood.foodList.length - 1) {
//                                 Future.delayed(Duration.zero, () {
//                                   ref
//                                       .read(restaurantStateProvider.notifier)
//                                       .onFoodScrolled(index);
//                                 });
//                               }

//                               return Card(
//                                 elevation: 1,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: Padding(
//                                   padding: const EdgeInsets.all(12.0),
//                                   child: Row(
//                                     children: [
//                                       ClipRRect(
//                                         borderRadius: BorderRadius.circular(8),
//                                         child: Image.network(
//                                           food.foodImage ?? "",
//                                           width: 70,
//                                           height: 70,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                       const SizedBox(width: 12),
//                                       Expanded(
//                                         child: Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               food.foodName ?? "",
//                                               style: const TextStyle(
//                                                   fontSize: 16,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                             const SizedBox(height: 5),
//                                             Text(
//                                               food.foodDescription ?? "",
//                                               style: const TextStyle(
//                                                   fontSize: 12,
//                                                   color: Colors.black54),
//                                               maxLines: 2,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         ),

//                         SizedBox(
//                           child: ListView.builder(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             itemCount:
//                                 menuStateNotifier.menuWithFoodList.length,
//                             itemBuilder: (context, index) {
//                               final menuWithFood =
//                                   menuStateNotifier.menuWithFoodList[index];
//                               if (menuStateNotifier.menuWithFoodList.isEmpty) {
//                                 return const Center(
//                                   child: Text("No data available"),
//                                 );
//                               }
//                               return Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Text(
//                                       menuWithFood.menuName,
//                                       style: const TextStyle(
//                                           fontSize: 18,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ),
//                                   ...menuWithFood.foodList.map((food) {
//                                     return Card(
//                                       elevation: 1,
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(10)),
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(12.0),
//                                         child: Row(
//                                           children: [
//                                             ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(8),
//                                               child: Image.network(
//                                                 food.foodImage ?? "",
//                                                 width: 70,
//                                                 height: 70,
//                                                 fit: BoxFit.cover,
//                                               ),
//                                             ),
//                                             const SizedBox(width: 12),
//                                             Expanded(
//                                               child: Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: [
//                                                   Text(
//                                                     food.foodName ?? "",
//                                                     style: const TextStyle(
//                                                         fontSize: 16,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   ),
//                                                   const SizedBox(height: 5),
//                                                   Text(
//                                                     food.foodDescription ?? "",
//                                                     style: const TextStyle(
//                                                         fontSize: 12,
//                                                         color: Colors.black54),
//                                                     maxLines: 2,
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                 ],
//                               );
//                             },
//                           ),
//                         )

//                         // menuItemsRef.when(
//                         //   data: (menu) {
//                         //     final menuStateNotifier =
//                         //         ref.watch(restaurantStateProvider);

//                         //     String activeMenuName = menuStateNotifier
//                         //             .menuList.isNotEmpty
//                         //         ? menuStateNotifier
//                         //                 .menuList[
//                         //                     menuStateNotifier.activeMenuIndex]
//                         //                 .menuName ??
//                         //             "N/A"
//                         //         : "N/A";

//                         //     return Column(
//                         //       crossAxisAlignment: CrossAxisAlignment
//                         //           .start,
//                         //       children: [
//                         //         Padding(
//                         //           padding: const EdgeInsets.symmetric(
//                         //               vertical: 10, horizontal: 16),
//                         //           child: Text(
//                         //             activeMenuName,
//                         //             style: const TextStyle(
//                         //                 fontSize: 20,
//                         //                 fontWeight: FontWeight.bold),
//                         //           ),
//                         //         ),
//                         //         ...menu.data!.map((food) {
//                         //           return GestureDetector(
//                         //             onTap: () {},
//                         //             child: Card(
//                         //               elevation: 1,
//                         //               shape: RoundedRectangleBorder(
//                         //                 borderRadius: BorderRadius.circular(10),
//                         //               ),
//                         //               child: Padding(
//                         //                 padding: const EdgeInsets.all(12.0),
//                         //                 child: Row(
//                         //                   children: [
//                         //                     ClipRRect(
//                         //                       borderRadius:
//                         //                           BorderRadius.circular(8),
//                         //                       child: Image.network(
//                         //                         food.foodImage ?? "",
//                         //                         width: 70,
//                         //                         height: 70,
//                         //                         fit: BoxFit.fill,
//                         //                       ),
//                         //                     ),
//                         //                     const SizedBox(width: 12),
//                         //                     Expanded(
//                         //                       child: Column(
//                         //                         crossAxisAlignment:
//                         //                             CrossAxisAlignment.start,
//                         //                         children: [
//                         //                           Text(
//                         //                             food.foodName ?? "",
//                         //                             style: const TextStyle(
//                         //                                 fontSize: 16,
//                         //                                 fontWeight:
//                         //                                     FontWeight.bold),
//                         //                           ),
//                         //                           const SizedBox(height: 5),
//                         //                           Text(
//                         //                             food.foodDescription ?? "",
//                         //                             style: const TextStyle(
//                         //                                 fontSize: 12,
//                         //                                 color: Colors.black54),
//                         //                             maxLines: 2,
//                         //                             overflow:
//                         //                                 TextOverflow.ellipsis,
//                         //                           ),
//                         //                           const SizedBox(height: 5),
//                         //                           Row(
//                         //                             children: [
//                         //                               Text(
//                         //                                 "${food.foodPrice} ${food.currency}",
//                         //                                 style: const TextStyle(
//                         //                                     fontSize: 14,
//                         //                                     fontWeight:
//                         //                                         FontWeight.bold,
//                         //                                     color: Colors.pink),
//                         //                               ),
//                         //                               const SizedBox(width: 8),
//                         //                               const Text(
//                         //                                 "765",
//                         //                                 style: TextStyle(
//                         //                                     fontSize: 12,
//                         //                                     color: Colors.grey,
//                         //                                     decoration:
//                         //                                         TextDecoration
//                         //                                             .lineThrough),
//                         //                               ),
//                         //                             ],
//                         //                           ),
//                         //                         ],
//                         //                       ),
//                         //                     ),
//                         //                     const SizedBox(width: 12),
//                         //                     IconButton(
//                         //                       icon: const Icon(Icons.add,
//                         //                           color: Colors.pink),
//                         //                       onPressed: () {},
//                         //                     ),
//                         //                   ],
//                         //                 ),
//                         //               ),
//                         //             ),
//                         //           );
//                         //         }).toList(),
//                         //       ],
//                         //     );
//                         //   },
//                         //   error: (error, stackTrace) {
//                         //     return Center(child: Text("Error: $error"));
//                         //   },
//                         //   loading: () =>
//                         //       const Center(child: CircularProgressIndicator()),
//                         // ),
//                       ],
//                     ),
//                   )
//                 ],
//               );
//             },
//             error: (error, stackTrace) {
//               return Center(
//                 child: Text("$error"),
//               );
//             },
//             loading: () => Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }

//   void _showProductBottomSheet(
//       BuildContext context, Map<String, dynamic> item) {
//     int quantity = 1;
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (context) {
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return Padding(
//               padding: const EdgeInsets.only(
//                   top: 8, left: 16, right: 16, bottom: 20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Image
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.network(
//                       item["image"],
//                       height: 200,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Product Name & Description
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       item["name"],
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       item["description"],
//                       style:
//                           const TextStyle(fontSize: 14, color: Colors.black54),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Price and Quantity Controls
//                   Row(
//                     children: [
//                       Text(
//                         item["price"],
//                         style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.pink),
//                       ),
//                       const SizedBox(width: 8),
//                       const Text(
//                         "(1 item)",
//                         style: TextStyle(fontSize: 14, color: Colors.black54),
//                       ),
//                       const Spacer(),
//                       IconButton(
//                         icon: const Icon(Icons.delete_outline,
//                             color: Colors.grey),
//                         onPressed: () {
//                           setState(() {
//                             quantity = 1; // Reset quantity on delete
//                           });
//                         },
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 12, vertical: 6),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10),
//                           border: Border.all(color: Colors.grey.shade300),
//                         ),
//                         child: Text(
//                           "$quantity",
//                           style: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       IconButton(
//                         icon: const Icon(Icons.add, color: Colors.pink),
//                         onPressed: () {
//                           setState(() {
//                             quantity++;
//                           });
//                         },
//                       ),
//                     ],
//                   ),

//                   const SizedBox(height: 20),

//                   // Add to Cart Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.pink,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         padding: const EdgeInsets.symmetric(vertical: 14),
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context); // Close BottomSheet
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                               content: Text("${item["name"]} added to cart!")),
//                         );
//                       },
//                       child: const Text("Add to cart",
//                           style: TextStyle(fontSize: 16, color: Colors.white)),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapptask/provider/state_change.dart';
import 'package:foodapptask/views/widget/custom_network_image.dart';
import '../provider/data_provider.dart';

class RestaurantMenuPage extends ConsumerStatefulWidget {
  const RestaurantMenuPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RestaurantMenuPageState();
}

class _RestaurantMenuPageState extends ConsumerState<RestaurantMenuPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final menuNotifier = ref.watch(restaurantStateProvider);

    // ✅ Only initialize TabController when menuList is available
    // ignore: unnecessary_null_comparison
    if (_tabController == null && menuNotifier.menuList.isNotEmpty) {
      _tabController = TabController(length: menuNotifier.menuList.length, vsync: this);
      _tabController.addListener(() {
        ref.read(restaurantStateProvider.notifier).changeMenu(_tabController!.index);
      });
      setState(() {}); // ✅ Update UI when TabController is ready
    }
  }


  @override
  void initState() {
    super.initState();
    final menuNotifier = ref.read(restaurantStateProvider);
    _tabController =
        TabController(length: menuNotifier.menuList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final restaurantInfoRef = ref.watch(restaurantInfoProvider);
    final menuNotifier = ref.watch(restaurantStateProvider);

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250.h,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    CustomNetworkImgWidget(
                      imageUrl:
                          restaurantInfoRef.value?.data?.profileImageUrl ?? "",
                      width: double.infinity,
                      heigth: 250.h,
                    ),
                    Positioned(
                      top: 24.h,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(CupertinoIcons.heart,
                                    color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(CupertinoIcons.search,
                                    color: Colors.white),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.more_vert_outlined,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ✅ Fixed Category Chips (TabBar)
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: _TabBarDelegate(
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  tabs: menuNotifier.menuList.map((menu) {
                    return Tab(text: menu.menuName);
                  }).toList(),
                  onTap: (index) {
                    menuNotifier.changeMenu(index);
                  },
                ),
              ),
            ),
          ];
        },

        // ✅ Scrollable Food List
        body: TabBarView(
          controller: _tabController,
          children: menuNotifier.menuList.map((menu) {
            return Consumer(
              builder: (context, ref, child) {
                final foodListRef =
                    ref.watch(foodItemByMenuProvider(menu.menuId!));

                return foodListRef.when(
                  data: (foodList) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: menuNotifier.menuWithFoodList.length,
                      itemBuilder: (context, index) {
                        final menuWithFood =
                            menuNotifier.menuWithFoodList[index];
                        if (menuNotifier.menuWithFoodList.isEmpty) {
                          return const Center(
                            child: Text("No data available"),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                menuWithFood.menuName,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ...menuWithFood.foodList.map((food) {
                              return Card(
                                elevation: 1,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          food.foodImage ?? "",
                                          width: 70,
                                          height: 70,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              food.foodName ?? "",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              food.foodDescription ?? "",
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        );
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text("Error: $error")),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

/// ✅ Helper class to make the TabBar sticky
class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
