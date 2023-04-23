import 'package:cached_network_image/cached_network_image.dart';
import 'package:caphore/features/categories/presentation/screeens/SubCategorys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String image;

  const CategoryCard({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/subcategories");
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
                  child: CachedNetworkImage(
                    imageUrl: image,
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  name,
                  style: TextStyle(),
                ),
              ],
            ),
          )),
    );
  }
}
