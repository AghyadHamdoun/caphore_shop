import 'package:caphore/core/utils/app_color.dart';
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
              backgroundColor: AppColor.whiteColor,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height / 2,
                    child: CarouselView(
                      itemExtent:
                          (imeges.length > 1) ? size.width / 1.2 : size.width,
                      itemSnapping: true,
                      scrollDirection: Axis.horizontal,
                      // padding: EdgeInsets.all(5.h),
                      children: List.generate(
                        imeges.length,
                        (int index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,

                              // boxShadow: [
                              //   BoxShadow(
                              //       color: Colors.black.withOpacity(0.4),
                              //       blurRadius: 50.r)
                              // ],
                              // image: DecorationImage(
                              //     image: NetworkImage(
                              //       imeges[index],
                              //     ),
                              //     fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: Image.network(
                              imeges[index],
                              fit: BoxFit.fill,
                            ),
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
