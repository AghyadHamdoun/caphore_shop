import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/brands.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/restaurants.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/stores.dart';
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
        ..add(const GetLastProductsEvent(pageNum: 1,perPage: 20))
        ..add(const GetMenClothingProductsEvent(pageNum: 1, categoryId: 44,perPage: 10))
        ..add(const GetWomenClothingProductsEvent(pageNum: 1, categoryId: 42, perPage: 10))
        ..add(const GetChildrenClothingProductsEvent(pageNum: 1, categoryId: 61, perPage: 10))
        ..add(const GetFoodProductsEvent(pageNum: 1, categoryId: 195, perPage: 10))
        ..add(const GetShoesAndBagsProductsEvent(pageNum: 1, categoryId: 102, perPage: 10))
        ..add(const GetWatchesAndAccessoriesProductsEvent(pageNum: 1, categoryId: 118, perPage: 10))
        ..add(const GetMobilesProductsEvent(pageNum: 1, categoryId: 123, perPage: 10))
        ..add(const GetPerfumesProductsEvent(pageNum: 1, categoryId: 108, perPage: 10))
        ..add(const GetMakeUpProductsEvent(pageNum: 1, categoryId: 117, perPage: 10))
        ..add(const GetPetsProductsEvent(pageNum: 1, categoryId: 421, perPage: 10))
        ..add(const GetBrandTermsEvent(pageNum: 1,perPage: 100, attributeId: 7))





      ,
      child: Scaffold(
        body: PageView(
          controller: controller,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            Brands(),
            Home(),
            Stores(),
            Restaurants(),
            ControlPanel(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/images/diamond-svgrepo-com.svg',
                color: AppColor.accentColor,
                height: 25.h,
                width: 20.w,
              ),
              label: "الماركات",
            ),
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
                "assets/images/store-svgrepo-com.svg",
                color: AppColor.accentColor,
                height: 25.h,
                width: 20.w,
              ),
              label: "المتاجر",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/images/restaurant-plate-svgrepo-com.svg",
                color: AppColor.accentColor,
                height: 25.h,
                width: 20.w,
              ),
              label: "المطاعم",
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
