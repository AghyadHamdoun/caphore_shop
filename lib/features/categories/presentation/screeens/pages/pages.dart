import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/categories.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/controlpanel.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyPages extends StatefulWidget {
  const MyPages({Key? key}) : super(key: key);

  @override
  State<MyPages> createState() => _MyPagesState();
}

class _MyPagesState extends State<MyPages> {
  late int select = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: select);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CategoriesBloc>()
        ..add(GetAllCategoriesEvent())
        ..add(const GetLastProductsEvent(pageNum: 1))
        ..add(const GetMenClothingProductsEvent(pageNum: 1, categoryId: 44)),
      child: Scaffold(
        body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            Home(),
            Categories(),
            ControlPanel(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/home_icon.svg',
                color: AppColor.accentColor,
                height: 25.h,
                width: 20.w,
              ),
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/categories3.svg',
                color: AppColor.accentColor,
                height: 25.h,
                width: 20.w,
              ),
              label: "الاصناف",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/icons8-puzzle.svg',
                color: AppColor.accentColor,
                height: 25.h,
                width: 20.w,
              ),
              label: "لوحة التحكم",
            ),
          ],
          currentIndex: select,
          onTap: (index) {
            setState(() {
              select = index;
            });
            controller.jumpToPage(select);
          },
          selectedItemColor: AppColor.accentColor,
          selectedFontSize: 16.sp,
          selectedIconTheme:
              IconThemeData(size: 30.r, color: AppColor.accentColor),
          showUnselectedLabels: false,
          unselectedIconTheme: IconThemeData(size: 30.r, color: Colors.grey),
        ),
      ),
    );
  }
}
