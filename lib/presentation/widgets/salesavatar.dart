import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class salesavatar extends StatelessWidget {
  const salesavatar({
    super.key,
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
          const Text("category\n sales"),
        ],
      ),
    );
  }
}
