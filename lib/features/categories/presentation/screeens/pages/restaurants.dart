import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/arabfoodresturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/cofferesturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/fastfoodresturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/sweetresturants_component.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/attrebutename.dart';

class Restaurants extends StatelessWidget {
  const Restaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AttributesBloc>()
        ..add(const GetFastFoodTermsEvent(
            pageNum: 1, attributeId: 21, perPage: 100))
        ..add(const GetArabFoodTermsEvent(
            pageNum: 1, attributeId: 22, perPage: 100))
        ..add(
            const GetSweetTermsEvent(pageNum: 1, attributeId: 23, perPage: 100))
        ..add(const GetCoffeeTermsEvent(
            pageNum: 1, attributeId: 24, perPage: 100)),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.h, left: 5.w, right: 5.w, bottom: 0),
                  child: const maintextform(),
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "الوجبات السريعة"),
                      ),
                      const FastFoodResturantsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "المطبخ العربي"),
                      ),
                      const ArabFoodResturantsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "الحلويات"),
                      ),
                      const SweetsResturantsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(
                            name: "الضيافة والمكسرات والقهوة"),
                      ),
                      const CoffeeResturantsComponent(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
