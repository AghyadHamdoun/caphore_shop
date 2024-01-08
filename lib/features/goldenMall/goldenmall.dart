import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/goldenMall/basket/cart.dart';
import 'package:caphore/features/categories/presentation/controller/categories_bloc.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/goldenMall/bloc/golden_bloc.dart';
import 'package:caphore/features/goldenMall/bloc/golden_state.dart';
import 'package:caphore/features/goldenMall/mallproducts.dart';
import 'package:caphore/features/goldenMall/mallsubcategories.dart';
import 'package:caphore/features/goldenMall/MallBannersComponent.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoldenMall extends StatelessWidget {
  const GoldenMall({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var bloc = sl<GoldenBloc>();
    return BlocConsumer<GoldenBloc, GoldenState>(
      bloc: bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            floatingActionButton:
                 Container(
                    width: size.width / 6,
                    child: FittedBox(
                      child: FloatingActionButton(
                        backgroundColor: AppColor.primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
                        },
                        child: Icon(
                          Icons.shopping_cart,
                          size: 40.r,
                        ),
                      ),
                    ),
                  ),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 3.h, left: 5.w, right: 5.w, bottom: 0),
                  child: const maintextform(),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(top: 10.h),
                    shrinkWrap: false,
                    physics: const BouncingScrollPhysics(),
                    children: const [
                      MallBannersComponent(),
                      MallsubCategoriesComponent(),
                      MallProductsComponent()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
