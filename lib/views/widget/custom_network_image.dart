import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNetworkImgWidget extends StatelessWidget {
  final double heigth;
  final double width;
  final String imageUrl;

  const CustomNetworkImgWidget({
    super.key,
    required this.heigth,
    required this.width,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return imageUrl.isNotEmpty && !imageUrl.contains('null')
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: heigth,
            fit: BoxFit.fill,
            placeholder: (context, url) => Center(
              child: Container(
                margin: EdgeInsets.all(8.r),
                height: heigth,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Image.asset(
                  "assets/default.jpg",
                  width: width,
                  height: heigth,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            errorWidget: (context, url, error) => Center(
              child: Text("Loading error"),
            ),
          )
        : Image.asset(
            "assets/default.jpg",
            width: width,
            height: heigth,
            fit: BoxFit.fill,
          );
  }
}
