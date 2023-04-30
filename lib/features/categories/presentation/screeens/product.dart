import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSliderWithIndex.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productbotoom.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ProductScreen extends StatelessWidget {
final Product product;

  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    List<String> imeges = [
      "https://images.unsplash.com/photo-1564419320461-6870880221ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      "https://plus.unsplash.com/premium_photo-1673971700988-346588461fa7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80",
      "https://images.unsplash.com/photo-1680263547745-4e0555920ea2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        titleTextStyle: TextStyle(color: Colors.blue, fontSize: 22.sp),
        title:  Text(product.name,style: const TextStyle(color: AppColor.accentColor),),
      ),
        bottomNavigationBar: ProductBottom(price: product.price, orginalPrice: product.regularPrice,),
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: ImageSliderWithIndex(imeges: product.images.map((e) => e.src).toList()),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: Text(
              product.name,
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: Divider(
              color: const Color.fromARGB(255, 95, 95, 95),
              thickness: 1.h,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: Text(
              "الوصف:",
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: Text(
          product.description,
              style: TextStyle(
                  fontSize: 18.sp, color: const Color.fromARGB(255, 73, 73, 73)),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: Text(
              "قد يعجبك ايضا",
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 8.h),
            child: SizedBox(
              height: 250.h,
              width: double.infinity.w,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return  const ProductCard(productname: '', price: '', orginalprice: '', image: '',);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
