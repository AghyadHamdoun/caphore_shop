import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/arabfoodresturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/cofferesturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/fastfoodresturants_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/sweetresturants_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../widgets/attrebutename.dart';

class Restaurants extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Restaurants({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = sl<AttributesBloc>();
    return BlocProvider(
      create: (context) => bloc..addAllRestaurants(isRefresh: false),
      child: BlocBuilder<AttributesBloc, AttributesState>(
        builder: (context, state) {
          switch (state.fastfoodTermsState) {
            case RequestState.loading:
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 3.h, left: 5.w, right: 5.w, bottom: 0),
                    child: const maintextform(),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Center(
                      child: Lottie.asset('assets/lottie/waiting.json',
                          fit: BoxFit.fill, height: 250.h),
                    ),
                  ),
                  Spacer()
                ],
              );
            case RequestState.loaded:
              return Scaffold(
                  body: RefreshIndicator(
                color: AppColor.accentColor,
                backgroundColor: AppColor.primaryColor,
                key: _refreshIndicatorKey,
                onRefresh: () async {
                  bloc.addAllRestaurants(isRefresh: true);
                },
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 3.h, left: 5.w, right: 5.w, bottom: 0),
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
              ));
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.fastfoodTermsMessage),
                ),
              );
          }
        },
      ),
    );
  }
}
