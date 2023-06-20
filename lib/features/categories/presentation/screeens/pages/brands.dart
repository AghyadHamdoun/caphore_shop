import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/attrebutename.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../attributes/presentation/screens/components/attributes/brands_component.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 10.h, left: 5.w, right: 5.w, bottom: 0),
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
        );
      },
    );
  }
}
