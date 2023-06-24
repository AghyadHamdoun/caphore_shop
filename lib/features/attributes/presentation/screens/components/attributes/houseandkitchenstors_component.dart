import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/attributes_event.dart';
import '../../../controller/attributes_state.dart';
import '../../storeproducts.dart';

class HouseAndKitchenStorsComponent extends StatelessWidget {
  const HouseAndKitchenStorsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttributesBloc, AttributesState>(
      builder: (context, state) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: state.houseandkitchenTerms.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StoreProducts(
                      event: GetTermProductsEvent(
                          attribute: 'house-supplies',
                          termId: state.houseandkitchenTerms[index].id,
                          perPage: 100,
                          pageNum: 1),
                      storeName: state.houseandkitchenTerms[index].name,
                      image: (state.houseandkitchenTerms[index].description
                                  .split(';')[2])
                              .isEmpty
                          ? ''
                          : (state.houseandkitchenTerms[index].description
                              .split(';')[2]),
                    ),
                  ),
                );
              },
              child: SizedBox(
                height: 120.h,
                child: CategoryCard(
                  name: state.houseandkitchenTerms[index].name,
                  image: (state.houseandkitchenTerms[index].description
                              .split(';')[1])
                          .isEmpty
                      ? ''
                      : (state.houseandkitchenTerms[index].description
                          .split(';')[1]),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
