import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:flutter/material.dart';
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
                  SizedBox(
                    height: size.height / 1.3,
                    child: CarouselView(
                      itemExtent: size.width,
                      itemSnapping: true,
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.all(5.h),
                      children: List.generate(
                        imeges.length,
                        (int index) {
                          return Column(
                            children: [
                              Container(
                                height: size.height / 1.3 - 30.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(imeges[index]),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 10.h,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: imeges.length,
                                  itemBuilder: (BuildContext context, int i) {
                                    return Container(
                                      height: 10.h,
                                      width: 10.w,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5.h),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: i == index
                                            ? Colors.orange
                                            : Colors.grey,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
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
