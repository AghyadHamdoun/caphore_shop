import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/attrebutename.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../attributes/presentation/controller/attributes_event.dart';
import '../../../../attributes/presentation/screens/components/attributes/brands_component.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<AttributesBloc>()
          ..add(const GetBrandTermsEvent(
              pageNum: 1, perPage: 100, attributeId: 7)),
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(top: 3.h, left: 5.w, right: 5.w, bottom: 0),
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
          ),
        ));
  }
}
