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

import '../widgets/attrebutename.dart';

class Stores extends StatefulWidget {
  const Stores({super.key});

  @override
  State<Stores> createState() => _StoresState();
}

class _StoresState extends State<Stores> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
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
                    const Expanded(
                      child: ClothingStorsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "الاحذية والحقائب"),
                    ),
                    const Expanded(
                      child: ShoesAndBagsStorsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child:
                          const AttributeName(name: " الكترونيات و كهربائيات"),
                    ),
                    const Expanded(
                      child: ElectronicEquipmentStorsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "مستلزمات المنزل"),
                    ),
                    const Expanded(
                      child: HouseAndKitchenStorsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: " الساعات والنظارات"),
                    ),
                    const Expanded(
                      child: WatchesAndAccessoriesStorsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "هدايا وعطورات"),
                    ),
                    const Expanded(
                      child: PerfumesStorsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "الصناعات اليدوية"),
                    ),
                    const Expanded(
                      child: HandMadeStorsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "رعاية الحيوانات"),
                    ),
                    const Expanded(
                      child: PetsStorsComponent(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, left: 10.w, right: 10.w, bottom: 0),
                      child: const AttributeName(name: "ألعاب الأطفال"),
                    ),
                    const Expanded(
                      child: ToysStorsComponent(),
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
