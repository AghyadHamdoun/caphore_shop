import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/component/category_product_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryProducts extends StatelessWidget {
  final CategoriesEvent event;
  final String categoryName;

  const CategoryProducts(
      {super.key, required this.event, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<CategoriesBloc>()..add(event),
        child: SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 3.h, left: 2.w, right: 2.w, bottom: 0),
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
                  children: const [
                    CategoryProductComponent(),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
