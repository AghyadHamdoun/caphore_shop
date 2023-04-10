import 'package:caphore/features/categories/presentation/screeens/SubCategorys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class categorycard extends StatelessWidget {
  const categorycard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const subcategorys(),
        ));
      },
      child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          color: const Color.fromARGB(255, 214, 214, 214),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 30.r,
                ),
                SizedBox(
                  height: 5.h,
                ),
                const Text("category\n name"),
              ],
            ),
          )),
    );
  }
}
