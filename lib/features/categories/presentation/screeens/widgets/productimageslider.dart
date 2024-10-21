import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/fullproductimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/services_locator.dart';

class Productimageslider extends StatelessWidget {
  final List<String> imeges;

  const Productimageslider({
    super.key,
    required this.imeges,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var bloc = sl<CategoriesBloc>();
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height / 2.5,
                child: CarouselView(
                  onTap: (value) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Fullproductimage(imeges: imeges)),
                    );
                  },
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
                            height: size.height / 2.5 - 30.h,
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
                                  margin: EdgeInsets.symmetric(horizontal: 5.h),
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
          );
        },
      ),
    );
  }
}
