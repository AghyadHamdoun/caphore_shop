import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/CategoryCard.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 30.h, left: 5.w, right: 5.w, bottom: 0),
                child: const maintextform(),
              ),
              Expanded(
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: state.allCategories.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 120.h,
                      child: CategoryCard(
                        name: state.allCategories[index].name,
                        image: state.allCategories[index].image.src,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
