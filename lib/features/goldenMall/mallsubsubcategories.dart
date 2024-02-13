import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/component/category_product_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/sub_sub_categories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:caphore/features/goldenMall/mall_category_product_component.dart';
import 'package:caphore/features/goldenMall/mall_sub_sub_sub_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MallSubSubCategories extends StatelessWidget {
  final CategoriesEvent event;
  final CategoriesEvent subEvent;
  final String categoryName;
  final int categoryId;
  const MallSubSubCategories(
      {super.key,
      required this.event,
      required this.subEvent,
      required this.categoryName,
      required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<CategoriesBloc>()
          ..add(event)
          ..add(subEvent),
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 3.h, left: 5.w, right: 5.w, bottom: 0),
                    child: const maintextform(),
                  ),
                  Text(
                    categoryName,
                    style: TextStyle(
                        color: AppColor.accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        const Mall_sub_sub_sub_category(),
                        mallCategoryProductComponent(
                          event: event,
                          categoryId: categoryId,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
