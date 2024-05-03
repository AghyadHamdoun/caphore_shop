import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/attributes_event.dart';
import '../../../controller/attributes_state.dart';
import '../../storeproducts.dart';

class PetsStorsComponent extends StatelessWidget {
  const PetsStorsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributesBloc, AttributesState>(
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: state.petsTerms.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoreProducts(
                      attribute: 'pet-care-center',
                      termid: state.petsTerms[index].id,
                      event: GetTermProductsEvent(
                          attribute: 'pet-care-center',
                          termId: state.petsTerms[index].id,
                          perPage: 100,
                          pageNum: 1),
                      storeName: state.petsTerms[index].name,
                      image: (state.petsTerms[index].description.split(';')[2])
                              .isEmpty
                          ? ''
                          : (state.petsTerms[index].description.split(';')[2]),
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 120.h,
                child: CategoryCard(
                  name: state.petsTerms[index].name,
                  image:
                      (state.petsTerms[index].description.split(';')[1]).isEmpty
                          ? ''
                          : (state.petsTerms[index].description.split(';')[1]),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
