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
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "الوجبات السريعة"),
                    ),
                    const Expanded(
                      child: FastFoodResturantsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "المطبخ العربي"),
                    ),
                    const Expanded(
                      child: ArabFoodResturantsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "الحلويات"),
                    ),
                    const Expanded(
                      child: SweetsResturantsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(
                          name: "الضيافة والمكسرات والقهوة"),
                    ),
                    const Expanded(
                      child: CoffeResturantsComponent(),
                    ),
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
