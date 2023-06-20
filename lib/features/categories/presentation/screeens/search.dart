import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:caphore/core/utils/app_color.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    int searchItems = 10;
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Column(
                children: [
                  Form(
                    child: TextFormField(
                      controller: controller,
                      enabled: true,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColor.primaryColor,
                        suffixIcon: Icon(
                          Icons.search,
                          size: 28.sp,
                          color: AppColor.accentColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    child: Text(" $searchItems :نتائج البحث"),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: 0.6.h),
                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.w, vertical: 3.h),
                          child: const ProductCard(
                            productname: '',
                            price: '',
                            orginalprice: '',
                            image: '',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
