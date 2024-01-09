import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/component/category_product_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:caphore/features/goldenMall/mall_category_product_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class mallCategoryProducts extends StatelessWidget {
  final CategoriesEvent event;
  final String categoryName;
  final int categoryId;

  const mallCategoryProducts(
      {super.key,
      required this.event,
      required this.categoryName,
      required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 3.h, left: 2.w, right: 2.w, bottom: 0),
              child: const maintextform(),
            ),
            Expanded(
                child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    categoryName,
                    style: TextStyle(
                        color: AppColor.accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                ),
                mallCategoryProductComponent(
                  event: event,
                  categoryId: categoryId,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
