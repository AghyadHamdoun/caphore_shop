import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/core/utils/enums.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/clothingstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/electronicequipmentstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/handmade_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/houseandkitchenstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/makeup_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/mass_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/perfumesstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/petsstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/shoesandbagsstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/toysstors_componets.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/watchesandaccessoriesstors_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../attributes/presentation/controller/attributes_bloc.dart';
import '../widgets/attrebutename.dart';

class Stores extends StatefulWidget {
  Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> with AutomaticKeepAliveClientMixin {


  @override
  Widget build(BuildContext context) {
    super.build(context);
    var bloc = sl<AttributesBloc>();
    return BlocProvider(
      create: (context) => bloc..addAllStores(isRefresh: false),
      child: BlocBuilder<AttributesBloc, AttributesState>(
        builder: (context, state) {
          switch (state.clothingTermsState) {
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
                  mainAxisSize: MainAxisSize.max,
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
                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child: const AttributeName(name: "الألبسة"),
                          ),
                          const ClothingStorsComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child:
                                const AttributeName(name: "الأحذية والحقائب"),
                          ),
                          const ShoesAndBagsStorsComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child: const AttributeName(
                                name: " الكترونيات و كهربائيات"),
                          ),
                          const ElectronicEquipmentStorsComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child: const AttributeName(
                                name: "الخردوات و مستلزمات المنزل"),
                          ),
                          const HouseAndKitchenStorsComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child: const AttributeName(
                                name: "المكياج والعناية بالبشرة"),
                          ),
                          const MakeUpComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child:
                                const AttributeName(name: " الساعات والنظارات"),
                          ),
                          const WatchesAndAccessoriesStorsComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child: const AttributeName(name: "هدايا وعطورات"),
                          ),
                          const PerfumesStorsComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child:
                                const AttributeName(name: "الصناعات اليدوية"),
                          ),
                          const HandMadeStorsComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child: const AttributeName(name: "رعاية الحيوانات"),
                          ),
                          const PetsStorsComponent(),

                          //
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child: const AttributeName(
                                name: "القرطاسية وألعاب الأطفال"),
                          ),
                          const ToysStorsComponent(),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                            child: const AttributeName(name: "الجملة"),
                          ),
                          const MassComponent()
                        ],
                      ),
                    ),
                  ],
                ),
              );
            case RequestState.error:
              return SizedBox(
                height: 280.h,
                child: Center(
                  child: Text(state.clothingTermsMessage),
                ),
              );
          }
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
