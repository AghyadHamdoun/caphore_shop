import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/services_locator.dart';

class Fullproductimage extends StatelessWidget {
  final List<String> imeges;

  const Fullproductimage({
    super.key,
    required this.imeges,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = sl<CategoriesBloc>();
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: imeges
                        .map(
                          (item) => Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item),
                                  fit: BoxFit.contain,
                                ),
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          bloc.add(CurrentSliderEvent(currentSlider: index));
                        },
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        autoPlay: true,
                        aspectRatio: 1),
                  ),
                  SizedBox(
                    height: 10.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: imeges.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 10.h,
                          width: 10.w,
                          margin: EdgeInsets.symmetric(horizontal: 5.h),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.currentSlider == index
                                ? Colors.orange
                                : Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
