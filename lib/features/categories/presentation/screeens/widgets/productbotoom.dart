import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductBottom extends StatelessWidget {
  const ProductBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 3,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            title: Row(
              children: [
                Text(
                  "price",
                  style: TextStyle(fontSize: 22.sp, color: Colors.blue),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Container(
                    height: 25.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.r)),
                  ),
                ),
              ],
            ),
            subtitle: Text(
              "orginal price",
              style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 16.sp,
                  color: Colors.grey),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, fixedSize: Size(250.w, 40.h)),
            onPressed: () {},
            icon: Icon(Icons.call),
            label: Text("buy it now"),
          )
        ],
      ),
    );
  }
}
