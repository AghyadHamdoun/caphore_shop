import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/categories/presentation/controller/categories_event.dart';
import 'package:caphore/features/categories/presentation/controller/categories_state.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/enums.dart';
import '../controller/categories_bloc.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    var bloc= sl<CategoriesBloc>();
    return BlocProvider(
      create: (context) =>bloc ,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(top: 27.h),
              child: Column(
                children: [
                  Form(
                    child: TextFormField(
                      onChanged: (string){
                        bloc.add(GetSearchProductsEvent(pageNum: 1, search: string, perPage: 100));
                      },
                      controller: controller,
                      enabled: true,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                      decoration: InputDecoration(
                        hintText: 'اضغط هنا للبحث ..',
                        hintStyle: TextStyle(color: AppColor.accentColor),
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
                    child: Text(" ${state.searchProducts.length} :نتائج البحث",style: TextStyle(fontSize: 20.sp),),
                  ),
                  const  SizedBox(height: 10,),
                Builder(builder:(context){
                  switch (state.searchProductsState) {
                    case RequestState.loading:
                      return Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Lottie.asset(
                            'assets/lottie/digishi.json',
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    case RequestState.loaded:
                    return  Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7.h),
                          itemCount: state.searchProducts.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
                              child:  ProductCard(
                                productname: state.searchProducts[index].name,
                                price: state.searchProducts[index].price,
                                orginalprice: state.searchProducts[index].regularPrice,
                                image:  state.searchProducts[index].images.isNotEmpty
                                    ? state.searchProducts[index].images[0].src
                                    : '',
                              ),
                            );
                          },
                        ),
                      );
                    case RequestState.error:
                      return SizedBox(
                        height: 280.h,
                        child: Center(
                          child: Text(state.searchProductsMessage),
                        ),
                      );
                  }
                } ),


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
