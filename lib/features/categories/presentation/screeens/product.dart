import 'package:caphore/core/utils/app_color.dart';
import 'package:caphore/features/categories/domain/entities/products.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSliderWithIndex.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productbotoom.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productimageslider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_html_css/simple_html_css.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  final List<Product> products;

  const ProductScreen({
    super.key,
    required this.product,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    print("=======================");
    print(product.id);
    print(product.shortDescription);
    print(product.categories[0].name);
    products.sort((a, b) {
      return a.name.hashCode.compareTo(b.name.hashCode);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        titleTextStyle: TextStyle(color: Colors.blue, fontSize: 22.sp),
        title: Text(
          "تفاصيل المنتج",
          style: const TextStyle(color: AppColor.accentColor),
        ),
      ),
      bottomNavigationBar: ProductBottom(
        price: product.price,
        orginalPrice: product.regularPrice,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.h),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
              child: SizedBox(
                height: 345.h,
                width: double.infinity,
                child: Productimageslider(
                  imeges: product.images.map((e) => e.src).toList(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Text(
                product.name,
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Divider(
                color: const Color.fromARGB(255, 95, 95, 95),
                thickness: 1.h,
              ),
            ),
            (product.shortDescription.isEmpty)
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Text(
                      "لا يوجد وصف ",
                      style: TextStyle(fontSize: 20.sp, color: Colors.grey),
                    ),
                  )
                : Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Text(
                      "الوصف:",
                      style: TextStyle(fontSize: 20.sp, color: Colors.black),
                    ),
                  ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: RichText(
                  text: HTML.toTextSpan(context, product.shortDescription),
                  //...
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: Text(
                "قد يعجبك ايضا:",
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: SizedBox(
                height: 285.h,
                width: double.infinity.w,
                child: Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (product.id != products[index].id) {
                        return InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductScreen(
                                            product: products[index],
                                            products: products,
                                          )));
                            },
                            child: ProductCard(
                              productname: products[index].name,
                              price: products[index].price,
                              orginalprice: products[index].regularPrice,
                              image: products[index].images.isNotEmpty
                                  ? products[index].images[0].src
                                  : '',
                            ));
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
//  (product.images.length == 1)
//                   ? Image.network(
//                       product.images[0].src,
//                       fit: BoxFit.fill,
//                       height: 300.h,
//                     )
//                   : ImageSliderWithIndex(
//                       imeges: product.images.map((e) => e.src).toList()),