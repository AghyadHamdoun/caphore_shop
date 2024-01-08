import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/goldenMall/Mallproductbotoom.dart';
import 'package:caphore/features/goldenMall/bloc/golden_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../bloc/golden_bloc.dart';
import '../bloc/golden_state.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  const CartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var nameAndNumber = [];
    String hide_wa_button = "no";
    int j = 0;
    Size size = MediaQuery.of(context).size;

    var bloc = sl<GoldenBloc>();
    return SafeArea(
      child: BlocConsumer<GoldenBloc, GoldenState>(
        bloc: bloc,
        listener: (context, state) {},
        builder: (context, state) {
          List<Product> products;
          products = state.basketProducts;
          if (products.isNotEmpty) {
            Product product = products[0];
            while (j <= (products[0].meta_data.length) - 1) {
              if (products[0].meta_data[j].key == "_hide_wa_button") {
                hide_wa_button = product.meta_data[j].value;
              }
              if (products[0].meta_data[j].key == "_wa_order_phone_number") {
                nameAndNumber = products[0].meta_data[j].value.split(';');
              }
              j++;
            }
            if (nameAndNumber.length < 2) {
              nameAndNumber = ['caphore', '963955942519'];
            }
          }
          return Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: products.isNotEmpty
                ? MallProductBottom(
                    products: products,
                    hide_wa_button: hide_wa_button,
                    name: products[0].name,
                    link: products[0].permalink,
                    storename: nameAndNumber[0],
                    price: products[0].price,
                    orginalPrice: '',
                    number: nameAndNumber[1],
                  )
                : null,
            body: products.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: state.basketProducts.isNotEmpty
                              ? state.basketProducts.length
                              : 0,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.h, vertical: 8.h),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: InkWell(
                                                onTap: () {
                                                  bloc.add(
                                                      DeleteProductFromBasket(
                                                          index: index));
                                                },
                                                child: Icon(Icons.close)),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: Container(
                                              height: size.height / 5,
                                              width: size.width / 4,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  scale: 1,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    products[index]
                                                            .images
                                                            .isNotEmpty
                                                        ? products[index]
                                                            .images[0]
                                                            .src
                                                        : '',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width / 1.6,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              child: Text(
                                                products[index].name,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    TextStyle(fontSize: 16.sp),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.grey,
                                              height: 10,
                                              thickness: 0.5,
                                            ),
                                            SizedBox(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("السعر"),
                                                  Text(
                                                    "${products[index].price}ل.س ",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .accentColor,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Divider(
                                              color: Colors.grey,
                                              height: 10,
                                              thickness: 0.5,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("الكمية"),
                                                SizedBox(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.remove,
                                                            color: Colors.grey),
                                                        onPressed: () {
                                                          bloc.add(MinusOne(
                                                              index: index));
                                                        },
                                                      ),
                                                      Text(
                                                          "${products[index].amount}",
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey)),
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.add,
                                                            color: Colors.grey),
                                                        onPressed: () {
                                                          bloc.add(IncreaseOne(
                                                              index: index));
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              color: Colors.grey,
                                              height: 10,
                                              thickness: 0.5,
                                            ),
                                            SizedBox(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("المجموع"),
                                                  Text(
                                                    "${products[index].total}ل.س ",
                                                    style: TextStyle(
                                                        color: AppColor
                                                            .accentColor,
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.h),
                                  child: const Divider(
                                    color: Colors.grey,
                                    height: 10,
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.grey.shade400,
                        size: 80.r,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            "سلة مشترياتك فارغة حاليا",
                            style: TextStyle(
                                fontSize: 24.sp, color: AppColor.textColor),
                          )),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            "قبل الشروع في الدفع ,يجب عليك اضافة بعض المنتجات الى عربة التسوق الخاصة بك. سوف تجد الكثير من المنتجات الشيقة على صفحة التسوق الخاصة بنا",
                           style: TextStyle(
                                fontSize: 18.sp, color: Colors.grey,),
                            textAlign: TextAlign.center,
                          )),
                      SizedBox(height: 10.h,),
                      SizedBox(
                        height: 40.h,
                        child: ElevatedButton(style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.accentColor,
                        ),onPressed: (){
                          Navigator.of(context).pop();
                        }
                            , child: Text("عودة لقائمة التسوق")),
                      )
                    ],
                  ),
          );
        },
      ),
    );
  }
}
// (products.isEmpty)
//               ? Scaffold(
//                   backgroundColor: Colors.white,
//                   body: Center(
//                     child: Column(
//                       children: [
//                         Container(
//                           child: Lottie.asset(
//                             'assets/lottie/digishi.json',
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         Text(
//                           "سلة المنتجات فارغة",
//                           style: TextStyle(
//                             fontSize: 22.sp,
//                             color: AppColor.accentColor,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               :
