import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SalesAvatar extends StatelessWidget {
  final String categorysales;
  const SalesAvatar({
    super.key, required this.categorysales,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CircleAvatar(backgroundColor: Colors.blue, radius: 40.r),
          SizedBox(
            height: 10.h,
          ),
           Text(categorysales),
        ],
      ),
    );
  }
}
