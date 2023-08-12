import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesAvatar extends StatelessWidget {
  final String image;
  final String name;
  const SalesAvatar({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 80.h,
            width: 75.w,
            imageUrl: image,
            errorWidget: (BuildContext context, a, b) =>
                Image.asset('assets/images/TT copy.png'),
          ),
          SizedBox(
            width: 90.w,
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              name,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
