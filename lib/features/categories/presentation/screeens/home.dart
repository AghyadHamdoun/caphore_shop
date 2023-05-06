import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/component/brands_component.dart';
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
      "https://images.unsplash.com/photo-1564419320461-6870880221ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://plus.unsplash.com/premium_photo-1673971700988-346588461fa7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
      "https://images.unsplash.com/photo-1680263547745-4e0555920ea2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
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
                    const CategoryNameAndShowAll(
                      name: 'المنتجات',
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
