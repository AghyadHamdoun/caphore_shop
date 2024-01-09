
import 'package:caphore/core/utils/app_color.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/services/services_locator.dart';
import '../categories/domain/entities/products.dart';
import 'bloc/golden_bloc.dart';
import 'bloc/golden_event.dart';
import 'bloc/golden_state.dart';

// ignore: must_be_immutable
class MallProductCard extends StatelessWidget {
 final Product product;
   MallProductCard({
    super.key,
     required this.product
  });

  var bloc = sl<GoldenBloc>();

  
  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      duration: Duration(seconds: 1),
      backgroundColor: AppColor.accentColor,
      content: Text('تم الاضافة الى السلة'),
    );
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<GoldenBloc, GoldenState>(
      bloc: bloc,
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: SizedBox(
        width: size.width / 2.7,
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 5.r,
                blurStyle: BlurStyle.outer,
                spreadRadius: 5.r,
                color: Colors.grey),
          ], borderRadius: BorderRadius.circular(20.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //image
              SizedBox(
                height: size.height / 5.5,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 1,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                        product.images.isNotEmpty ? product.images[0].src :'',
                      ),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r),
                    ),
                  ),
                ),
              ),
              //name
              SizedBox(
                height: 48.h,
                child: Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15.sp),
                  textAlign: TextAlign.center,
                ),
              ),
              //salary
              SizedBox(
                height: (product.regularPrice.isNotEmpty && product.regularPrice != product.price)
                    ? size.height / 12
                    : size.height / 19,
              child:  Column(children: [
                   (product.price == "33" || product.price == '')
                      ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      " تواصل لمعرفة السعر",
                      style: TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                      : FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "${product.price} ل.س ",
                      style: TextStyle(
                          color: Colors.orange,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                   if (product.regularPrice.isNotEmpty && product.regularPrice != product.price)
                   Text(
                     product.regularPrice != '' ? "${product.regularPrice}  ل.س " : '',
                     style: TextStyle(
                         decoration: TextDecoration.lineThrough,
                         fontSize: 14.sp,
                         color: Colors.grey),
                   )

                ],)
              ),
              // add button
              SizedBox(
                height: 25.h,
                child: ElevatedButton(
                  onPressed: () {
                    bloc.add(AddProductToBasket(productModel: product));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.accentColor),
                  child: Text("أضف الى السلة"),
                ),
              ),
              SizedBox(height: 3.h,)
            ],
          ),
        ),
      ),
    );
  },
);
  }
}
