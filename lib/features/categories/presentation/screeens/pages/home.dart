import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/children_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/food_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/last_product.dart';
import 'package:caphore/features/categories/presentation/screeens/component/categories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/makeup_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/men_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/mobiles_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/perfumes_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/pets_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/shoesandbags_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/watchesandaccessories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/products/women_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSlider.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSliderWithIndex.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imeges = [
      "https://caphore.sy/wp-content/uploads/2022/12/zona_optimized.jpg",
      "https://caphore.sy/wp-content/uploads/2022/11/jf-1_optimized.jpg",
      "https://caphore.sy/wp-content/uploads/2023/03/whatsapp-image-2023-03-11-at-7_optimized.51.19-pm-min-1024x438-1.jpg"
    ];

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 30.h, left: 5.w, right: 5.w, bottom: 0),
            child: const maintextform(),
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                    height: 220.h, child: ImageSliderWithIndex(imeges: imeges)),
                const CategoriesComponent(),
                CategoryNameAndShowAll(
                  name: 'عروض كافور',
                  showAllCallBack: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryProducts(
                                  event: GetLastProductsEvent(
                                      pageNum: 1, perPage: 10),
                                  categoryName: 'عروض كافور',
                                )));
                  },
                ),
                const LastProductComponent(),

                CategoryNameAndShowAll(
                  name: 'الالبسة الرجالية',
                  showAllCallBack: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryProducts(
                                  event: GetGategoryProductsEvent(
                                      categoryId: 44, pageNum: 1, perPage: 100),
                                  categoryName: 'الالبسة الرجالية',
                                )));
                  },
                ),
                const MenClothingComponent(),
                CategoryNameAndShowAll(
                  name: 'الالبسة النسائية',
                  showAllCallBack: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryProducts(
                                  event: GetGategoryProductsEvent(
                                      categoryId: 42, pageNum: 1, perPage: 100),
                                  categoryName: 'الالبسة النسائية',
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
                                  event: GetGategoryProductsEvent(
                                      categoryId: 61, pageNum: 1, perPage: 100),
                                  categoryName: 'الألبسة الولادية ',
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
                                  event: GetGategoryProductsEvent(
                                      categoryId: 195,
                                      pageNum: 1,
                                      perPage: 100),
                                  categoryName: 'المأكولات ',
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
                                  event: GetGategoryProductsEvent(
                                      categoryId: 102,
                                      pageNum: 1,
                                      perPage: 100),
                                  categoryName: 'الأحذية والحقائب ',
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
                                  event: GetGategoryProductsEvent(
                                      categoryId: 118,
                                      pageNum: 1,
                                      perPage: 100),
                                  categoryName: ' الساعات والاكسسوارات ',
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
                                  event: GetGategoryProductsEvent(
                                      categoryId: 123,
                                      pageNum: 1,
                                      perPage: 100),
                                  categoryName: '  الالكترونيات ',
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
                                  event: GetGategoryProductsEvent(
                                      categoryId: 108,
                                      pageNum: 1,
                                      perPage: 100),
                                  categoryName: '  العطور ',
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
                                  event: GetGategoryProductsEvent(
                                      categoryId: 117,
                                      pageNum: 1,
                                      perPage: 100),
                                  categoryName: '  المكياج ',
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
                                  event: GetGategoryProductsEvent(
                                      categoryId: 421,
                                      pageNum: 1,
                                      perPage: 100),
                                  categoryName: '  الحيونات الأليفة ',
                                )));
                  },
                ),
                const PetsComponent(),
              ],
            ),
          ),
        ],
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
