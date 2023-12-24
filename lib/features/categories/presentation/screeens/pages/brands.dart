import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/attrebutename.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../attributes/presentation/controller/attributes_event.dart';
import '../../../../attributes/presentation/screens/components/attributes/brands_component.dart';

class Brands extends StatelessWidget {
  Brands({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    var bloc = sl<AttributesBloc>();
    return BlocProvider(
        create: (context) => bloc
          ..add(const GetBrandTermsEvent(
              pageNum: 1, perPage: 100, attributeId: 7, isRefresh: false)),
        child: BlocBuilder<AttributesBloc, AttributesState>(
          builder: (context, state) {
            switch (state.brandsTermsState) {
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
                    body: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: 3.h, left: 5.w, right: 5.w, bottom: 0),
                          child: const maintextform(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                          child: const AttributeName(name: "الماركات"),
                        ),
                        const Expanded(
                          child: BrandsComponent(),
                        ),
                      ],
                    ));
              case RequestState.error:
                return SizedBox(
                  height: 280.h,
                  child: Center(
                    child: Text(state.brandsTermsMessage),
                  ),
                );
            }
          },
        ));
  }
}
