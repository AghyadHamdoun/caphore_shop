import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/attributes_state.dart';

class BrandsComponent extends StatelessWidget {
  const BrandsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributesBloc, AttributesState>(
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: state.brandsTerms.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 120.h,
              child: CategoryCard(
                name: state.brandsTerms[index].name,
                image:
                    (state.brandsTerms[index].description.split(';')[1]).isEmpty
                        ? ''
                        : (state.brandsTerms[index].description.split(';')[1]),
              ),
            );
          },
        );
      },
    );
  }
}