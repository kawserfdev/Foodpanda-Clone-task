import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodapptask/constants/app_constants.dart';
import 'package:foodapptask/views/product_datails_page.dart';
import 'package:foodapptask/views/widget/custom_network_image.dart';

import '../provider/data_provider.dart';

class RestaurantMenuPage extends ConsumerWidget {
  final List<String> categories = [
    "Pizza",
    "Chicken",
    "Burger",
    "Platter",
    "Chinese"
  ];
  final List<Map<String, dynamic>> menuItems = [
    {
      "category": "Pizza",
      "items": [
        {
          "name": "Pizza Margherita",
          "description":
              "250 gm - Tangy & spicy, a crunch of chicken and cheese with mustard oil & meat.",
          "price": "AED 120",
          "oldPrice": "AED 150",
          "image":
              "https://images.unsplash.com/photo-1590947132387-155cc02f3212?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        },
        {
          "name": "Pizza Margherita",
          "description":
              "250 gm - Tangy & spicy, a crunch of chicken and cheese with mustard oil & meat.",
          "price": "AED 120",
          "oldPrice": "AED 150",
          "image":
              "https://images.unsplash.com/photo-1590947132387-155cc02f3212?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        },
      ]
    },
    {
      "category": "Rice",
      "items": [
        {
          "name": "Rice with Chicken",
          "description":
              "250 gm - Tangy & spicy, a crunch of chicken and cheese with mustard oil & meat.",
          "price": "AED 120",
          "oldPrice": "AED 150",
          "image":
              "https://images.unsplash.com/photo-1590947132387-155cc02f3212?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        },
        {
          "name": "Rice with Chicken",
          "description":
              "250 gm - Tangy & spicy, a crunch of chicken and cheese with mustard oil & meat.",
          "price": "AED 120",
          "oldPrice": "AED 150",
          "image":
              "https://images.unsplash.com/photo-1590947132387-155cc02f3212?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        },
      ]
    }
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantInfoRef = ref.watch(restaurantInfoProvider);
    final foodMenuRef = ref.watch(restaurantFoodMenuProvider);
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: restaurantInfoRef.when(
            data: (restaurant) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomNetworkImgWidget(
                      imageUrl: restaurant.data?.profileImageUrl ?? "",
                      width: double.infinity,
                      heigth: 208.h),
                  Padding(
                    padding: EdgeInsets.only(top: 24.h),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_back,
                              color: AppColors.whiteColor,
                            )),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.heart,
                              color: AppColors.whiteColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.search,
                              color: AppColors.whiteColor,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert_outlined,
                              color: AppColors.whiteColor,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 190.h),
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(16.r),
                            topLeft: Radius.circular(16.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                            Text(
                              "${restaurant.data?.name} ⓘ" ?? "Unknown Name",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "🚚 Delivery 15-25 mins  •  📍 2 km Away",
                              style:
                              TextStyle(fontSize: 14, color: Colors.black54),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "❤️ Free delivery  •  Min order 30 AED",
                              style: TextStyle(fontSize: 14, color: Colors.red),
                            ),
                          ],),
                        ),


                        // Discount Banners
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text("20% off",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.pink)),
                                    Text("Up to 300 AED",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Text("20% off",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange)),
                                    Text("Up to 300 AED",
                                        style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 15),

                        // Category Chips
                        SizedBox(
                          height: 40,
                          child: foodMenuRef.when(
                            data: (menu) => ListView.builder(
                              itemCount: menu.data?.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                final item = menu.data?[index];
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Chip(
                                    label: Text(item?.menuName ?? ""),
                                    labelStyle: TextStyle(
                                        color: item?.menuName == "Pizza"
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                );
                              },
                            ),
                            error: (error, stackTrace) => Chip(
                              label: Text("Menu Item Not Available"),
                              backgroundColor: Colors.grey[200],
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                            loading: () {
                              return ListView.builder(
                                itemCount: 6,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(right: 8.0),
                                    child: Chip(
                                      label: Container(
                                        width: 80,
                                        color: Colors.grey,
                                      ),
                                      backgroundColor: Colors.grey[200],
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 15),

                        // Menu Items
                        Column(
                          children: menuItems.map((category) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  category["category"],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  children: (category["items"] as List)
                                      .map((item) => GestureDetector(
                                            onTap: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //       builder: (context) =>
                                              //           FoodDetailsPage(),
                                              //     ));
                                              _showProductBottomSheet(
                                                  context, item);
                                            },
                                            child: Card(
                                              elevation: 1,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    12.0),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius
                                                              .circular(8),
                                                      child: Image.network(
                                                        item["image"],
                                                        width: 70,
                                                        height: 70,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12),
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            item["name"],
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Text(
                                                            item[
                                                                "description"],
                                                            style: const TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .black54),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          const SizedBox(
                                                              height: 5),
                                                          Row(
                                                            children: [
                                                              Text(
                                                                item["price"],
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .pink),
                                                              ),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Text(
                                                                item[
                                                                    "oldPrice"],
                                                                style: const TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .grey,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 12),
                                                    IconButton(
                                                      icon: const Icon(
                                                          Icons.add,
                                                          color: Colors.pink),
                                                      onPressed: () {},
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                ),
                                const SizedBox(height: 15),
                              ],
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Text("$error"),
              );
            },
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ]),
    );
  }

  void _showProductBottomSheet(
      BuildContext context, Map<String, dynamic> item) {
    int quantity = 1;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 16, right: 16, bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      item["image"],
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Product Name & Description
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item["name"],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item["description"],
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Price and Quantity Controls
                  Row(
                    children: [
                      Text(
                        item["price"],
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "(1 item)",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            quantity = 1; // Reset quantity on delete
                          });
                        },
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          "$quantity",
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add, color: Colors.pink),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Add to Cart Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close BottomSheet
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("${item["name"]} added to cart!")),
                        );
                      },
                      child: const Text("Add to cart",
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
