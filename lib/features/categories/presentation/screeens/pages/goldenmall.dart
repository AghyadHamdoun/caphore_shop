import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/category_product_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/mallsubcategories.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/MallBannersComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/chips_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/conserves_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/drinks_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/legumes_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/milk_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/oils_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/pasrties_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/MallComponent/salts_component.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/pages.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSliderWithIndex.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Goldenmall extends StatelessWidget {
  const Goldenmall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        color: AppColor.accentColor,
        backgroundColor: AppColor.primaryColor,
        onRefresh: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const MyPages()));
        },
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w, bottom: 0),
              child: const maintextform(),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(top: 10.h),
                shrinkWrap: false,
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(child: MallBannersComponent()),
                  const MallsubCategoriesComponent(),
                  CategoryNameAndShowAll(
                    name: 'البقوليات',
                    showAllCallBack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        categoryId: 701,
                                        pageNum: 1,
                                        perPage: 10,
                                        lastProducts: []),
                                    categoryName: 'البقوليات ',
                                    categoryId: 701,
                                  )));
                    },
                  ),
                  LegumesComponent(
                      event: const GetCategoryProductsEvent(
                          pageNum: 1,
                          categoryId: 701,
                          perPage: 100,
                          lastProducts: []),
                      categoryId: 701),
                  CategoryNameAndShowAll(
                    name: 'الزيوت والسمون',
                    showAllCallBack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        categoryId: 710,
                                        pageNum: 1,
                                        perPage: 10,
                                        lastProducts: []),
                                    categoryName: 'الزيوت والسمون',
                                    categoryId: 710,
                                  )));
                    },
                  ),
                  OilComponent(
                    event: const GetCategoryProductsEvent(
                        categoryId: 710,
                        pageNum: 1,
                        perPage: 10,
                        lastProducts: []),
                    categoryId: 710,
                  ),
                  CategoryNameAndShowAll(
                    name: 'الكنسروة',
                    showAllCallBack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        categoryId: 726,
                                        pageNum: 1,
                                        perPage: 10,
                                        lastProducts: []),
                                    categoryName: 'الكنسروة',
                                    categoryId: 726,
                                  )));
                    },
                  ),
                  ConservesComponent(
                    event: const GetCategoryProductsEvent(
                        categoryId: 726,
                        pageNum: 1,
                        perPage: 10,
                        lastProducts: []),
                    categoryId: 726,
                  ),
                  CategoryNameAndShowAll(
                    name: 'الألبان والأجبان',
                    showAllCallBack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        categoryId: 717,
                                        pageNum: 1,
                                        perPage: 10,
                                        lastProducts: []),
                                    categoryName: 'الألبان والأجبان',
                                    categoryId: 717,
                                  )));
                    },
                  ),
                  MilkComponent(
                    event: const GetCategoryProductsEvent(
                        categoryId: 717,
                        pageNum: 1,
                        perPage: 10,
                        lastProducts: []),
                    categoryId: 717,
                  ),
                  CategoryNameAndShowAll(
                    name: ' البسكويت والشيبس',
                    showAllCallBack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        categoryId: 718,
                                        pageNum: 1,
                                        perPage: 10,
                                        lastProducts: []),
                                    categoryName: ' البسكويت والشيبس',
                                    categoryId: 718,
                                  )));
                    },
                  ),
                  ChipsComponent(
                    event: const GetCategoryProductsEvent(
                        categoryId: 718,
                        pageNum: 1,
                        perPage: 10,
                        lastProducts: []),
                    categoryId: 718,
                  ),
                  CategoryNameAndShowAll(
                    name: ' المعجنات',
                    showAllCallBack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        categoryId: 727,
                                        pageNum: 1,
                                        perPage: 10,
                                        lastProducts: []),
                                    categoryName: 'المعجنات ',
                                    categoryId: 727,
                                  )));
                    },
                  ),
                  PastriesComponent(
                    event: const GetCategoryProductsEvent(
                        categoryId: 727,
                        pageNum: 1,
                        perPage: 10,
                        lastProducts: []),
                    categoryId: 727,
                  ),
                  CategoryNameAndShowAll(
                    name: ' الموالح والتمر',
                    showAllCallBack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        categoryId: 723,
                                        pageNum: 1,
                                        perPage: 10,
                                        lastProducts: []),
                                    categoryName: 'الموالح والتمر ',
                                    categoryId: 723,
                                  )));
                    },
                  ),
                  SaltsComponent(
                    event: const GetCategoryProductsEvent(
                        categoryId: 723,
                        pageNum: 1,
                        perPage: 10,
                        lastProducts: []),
                    categoryId: 723,
                  ),
                  CategoryNameAndShowAll(
                    name: ' العصائر والمشروبات الغازية',
                    showAllCallBack: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CategoryProducts(
                                    event: GetCategoryProductsEvent(
                                        categoryId: 700,
                                        pageNum: 1,
                                        perPage: 10,
                                        lastProducts: []),
                                    categoryName: 'العصائر والمشروبات الغازية',
                                    categoryId: 700,
                                  )));
                    },
                  ),
                  DrinksComponent(
                    event: const GetCategoryProductsEvent(
                        categoryId: 700,
                        pageNum: 1,
                        perPage: 10,
                        lastProducts: []),
                    categoryId: 700,
                  ),
                  Center(
                    child: Text(
                      "كافة منتجات غولدن مول",
                      style: TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  CategoryProductComponent(
                      event: const GetCategoryProductsEvent(
                          pageNum: 1,
                          categoryId: 693,
                          perPage: 100,
                          lastProducts: []),
                      categoryId: 693),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
