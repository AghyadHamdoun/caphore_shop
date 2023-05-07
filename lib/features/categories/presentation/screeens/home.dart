import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/brands_component.dart';
import 'package:caphore/features/categories/presentation/screeens/component/men_clothing_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryNameAndShowAll.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSlider.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/salesavatar.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 30.h, left: 5.w, right: 5.w, bottom: 0),
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
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      height: 140.h,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.allCategories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CategoryProducts(
                                              categoryId:
                                                  state.allCategories[index].id,
                                              categoryName: state
                                                  .allCategories[index].name,
                                            )));
                              },
                              child: SalesAvatar(
                                  name: state.allCategories[index].name,
                                  image: state.allCategories[index].image.src));
                        },
                      ),
                    ),
                    CategoryNameAndShowAll(
                      name: 'الالبسة الرجالية',
                      showAllCallBack: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CategoryProducts(
                                      categoryId: 44,
                                      categoryName: 'الالبسة الرجالية',
                                    )));
                      },
                    ),
                    const MenClothingComponent(),
                    CategoryNameAndShowAll(
                      name: 'الالبسة النسائية',
                      showAllCallBack: () {},
                    ),
                    const BrandComponent(),

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
      },
    );
  }
}
