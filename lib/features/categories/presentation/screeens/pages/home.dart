import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/attributes/presentation/screens/components/banners_two_component.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/children_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/food_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/categories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/makeup_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/men_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/mobiles_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/offers_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/perfumes_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/pets_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/shoesandbags_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/watchesandaccessories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/women_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/pages.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSliderWithIndex.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: RefreshIndicator(
              color: AppColor.accentColor,
              backgroundColor: AppColor.primaryColor,
              onRefresh: ()async {   Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyPages())); },
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
                        const SizedBox(child: ImageSliderWithIndex()),
                        const CategoriesComponent(),
                        CategoryNameAndShowAll(
                          name: 'عروض كافور',
                          showAllCallBack: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CategoryProducts(
                                          event: GetCategoryProductsEvent(
                                              categoryId: 644,
                                              pageNum: 1,
                                              perPage: 10,
                                              lastProducts: []),
                                          categoryName: 'عروض كافور',
                                          categoryId: 644,
                                        )));
                          },
                        ),
                        const OffersProductsComponent(),
                        CategoryNameAndShowAll(
                          name: 'الالبسة الرجالية',
                          showAllCallBack: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const CategoryProducts(
                                          event: GetCategoryProductsEvent(
                                              categoryId: 44,
                                              pageNum: 1,
                                              perPage: 10,
                                              lastProducts: []),
                                          categoryName: 'الالبسة الرجالية',
                                          categoryId: 44,
                                        )));
                          },
                        ),

                              const MenClothingComponent(),
                              const ImageSliderTwoWithIndex(),

                              CategoryNameAndShowAll(
                                name: 'الالبسة النسائية',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 42,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: 'الالبسة النسائية',
                                                categoryId: 42,
                                              )));
                                },
                              ),
                              const WomenClothingComponent(),
                              // step number 2
                              CategoryNameAndShowAll(
                                name: ' الألبسة الولادية',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 61,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: 'الألبسة الولادية ',
                                                categoryId: 61,
                                              )));
                                },
                              ),
                              const ChildrenClothingComponent(),
                              CategoryNameAndShowAll(
                                name: ' المأكولات',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 195,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: 'المأكولات ',
                                                categoryId: 195,
                                              )));
                                },
                              ),
                              const FoodComponent(),
                              CategoryNameAndShowAll(
                                name: ' الأحذية والحقائب',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 102,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: 'الأحذية والحقائب ',
                                                categoryId: 102,
                                              )));
                                },
                              ),
                              const ShoesandbagsComponent(),
                              CategoryNameAndShowAll(
                                name: ' الساعات والاكسسوارات ',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 118,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: ' الساعات والاكسسوارات ',
                                                categoryId: 118,
                                              )));
                                },
                              ),
                              const WatchesandaccessoriesComponent(),
                              CategoryNameAndShowAll(
                                name: '  الالكترونيات ',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 123,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: '  الالكترونيات ',
                                                categoryId: 123,
                                              )));
                                },
                              ),
                              const MobilesComponent(),
                              CategoryNameAndShowAll(
                                name: '  العطور ',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 108,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: '  العطور ',
                                                categoryId: 108,
                                              )));
                                },
                              ),
                              const PerfumesComponent(),
                              CategoryNameAndShowAll(
                                name: '  المكياج ',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 112,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: '  المكياج ',
                                                categoryId: 112,
                                              )));
                                },
                              ),
                              const MakeupComponent(),
                              CategoryNameAndShowAll(
                                name: '  الحيوانات الأليفة ',
                                showAllCallBack: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const CategoryProducts(
                                                event: GetCategoryProductsEvent(
                                                    categoryId: 421,
                                                    pageNum: 1,
                                                    perPage: 10,
                                                    lastProducts: []),
                                                categoryName: '  الحيونات الأليفة ',
                                                categoryId: 421,
                                              )));
                                },
                              ),
                              const PetsComponent(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
  }
}
// const Padding(
//   padding: EdgeInsets.all(8.0),
//   child: BrandCard(
//     image: '',
//   ),
// ),
