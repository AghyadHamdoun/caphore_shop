import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryNameAndShowAll extends StatelessWidget {
  const CategoryNameAndShowAll({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("new products"),
          TextButton(
            onPressed: () {},
            child: Text(
              "show all >",
              style: TextStyle(fontSize: 16.sp, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
