import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/clothingstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/electronicequipmentstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/handmade_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/houseandkitchenstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/perfumesstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/petsstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/shoesandbagsstors_component.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/toysstors_componets.dart';
import 'package:caphore/features/attributes/presentation/screens/components/attributes/watchesandaccessoriesstors_component.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/services_locator.dart';
import '../../../../attributes/presentation/controller/attributes_bloc.dart';
import '../widgets/attrebutename.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AttributesBloc>()
        ..add(const GetClothingTermsEvent(
            pageNum: 1, attributeId: 11, perPage: 100))
        ..add(const GetShoesAndBagsTermsEvent(
            pageNum: 1, attributeId: 13, perPage: 100))
        ..add(const GetElectronicEquipmentTermsEvent(
            pageNum: 1, attributeId: 12, perPage: 100))
        ..add(const GetHouseAndKitchenTermsEvent(
            pageNum: 1, attributeId: 14, perPage: 100))
        ..add(const GetWatchesAndAccessoriesTermsEvent(
            pageNum: 1, attributeId: 16, perPage: 100))
        ..add(const GetPerfumesTermsEvent(
            pageNum: 1, attributeId: 17, perPage: 100))
        ..add(const GetHandMadeTermsEvent(
            pageNum: 1, attributeId: 18, perPage: 100))
        ..add(
            const GetPetsTermsEvent(pageNum: 1, attributeId: 19, perPage: 100))
        ..add(
            const GetToysTermsEvent(pageNum: 1, attributeId: 20, perPage: 100)),
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              mainAxisSize: MainAxisSize.max,
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
                        child: const AttributeName(name: "الالبسة"),
                      ),
                      const ClothingStorsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "الاحذية والحقائب"),
                      ),
                      const ShoesAndBagsStorsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(
                            name: " الكترونيات و كهربائيات"),
                      ),
                      const ElectronicEquipmentStorsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "مستلزمات المنزل"),
                      ),
                      const HouseAndKitchenStorsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: " الساعات والنظارات"),
                      ),
                      const WatchesAndAccessoriesStorsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "هدايا وعطورات"),
                      ),
                      const PerfumesStorsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "الصناعات اليدوية"),
                      ),
                      const HandMadeStorsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "رعاية الحيوانات"),
                      ),
                      const PetsStorsComponent(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                        child: const AttributeName(name: "ألعاب الأطفال"),
                      ),
                      const ToysStorsComponent(),
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
