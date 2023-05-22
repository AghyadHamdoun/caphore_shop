import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/last_product.dart';
import 'package:caphore/features/categories/presentation/screeens/component/categories_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/men_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/women_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSlider.dart';
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
                  height: 170.h,
                  child: ImageSlider(imeges: imeges),
                ),
                CategoryNameAndShowAll(
                  name: 'عروض كافور',
                  showAllCallBack: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryProducts(
                                  event: GetLastProductsEvent(pageNum: 1,perPage: 10),
                                  categoryName: 'عروض كافور',
                                )));
                  },
                ),
                const LastProductComponent(),
                const CategoriesComponent(),
                CategoryNameAndShowAll(
                  name: 'الالبسة الرجالية',
                  showAllCallBack: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CategoryProducts(
                              event: GetGategoryProductsEvent(
                                  categoryId: 44, pageNum: 1,perPage: 100),
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
                                  categoryId: 42, pageNum: 1,perPage: 100),
                              categoryName: 'الالبسة النسائية',
                            )));
                  },
                ),
                const WomenClothingComponent(),

                // const Padding(
                //   padding: EdgeInsets.all(8.0),
                //   child: BrandCard(
                //     image: '',
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
