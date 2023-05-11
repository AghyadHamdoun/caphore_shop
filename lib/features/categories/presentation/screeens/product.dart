
import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSliderWithIndex.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productbotoom.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_html_css/simple_html_css.dart';



class ProductScreen extends StatelessWidget {
final Product product;
final List <Product> products;

  const ProductScreen({super.key, required this.product, required this.products,});

  @override
  Widget build(BuildContext context) {

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        child: ListView(
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 10.h),
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
              child:RichText(
                text: HTML.toTextSpan(context, product.shortDescription),
                //...
              )
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
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {

                      if(product.id!=products[index].id) {
                        return  ProductCard(productname: products[index].name, price: products[index].price, orginalprice: products[index].regularPrice, image: products[index].images[0].src,);
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
