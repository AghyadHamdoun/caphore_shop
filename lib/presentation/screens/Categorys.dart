import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/CategoryCard.dart';
import '../widgets/textformfild.dart';

class Categorys extends StatefulWidget {
  const Categorys({super.key});

  @override
  State<Categorys> createState() => _CategorysState();
}

class _CategorysState extends State<Categorys> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:
                EdgeInsets.only(top: 30.h, left: 5.w, right: 5.w, bottom: 0),
            child: const maintextform(),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 20,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 120.h,
                  child: const categorycard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
