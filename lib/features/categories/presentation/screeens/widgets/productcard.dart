import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  final String productname;
  final String price;
  final String orginalprice;
  const ProductCard({
    super.key, required this.productname, required this.price, required this.orginalprice,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("/product");
      },
      child: SizedBox(
        height: 250.h,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 100.h,
                      width: 80.w,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 25.h,
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20.r)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    child: Text(
                     productname ,
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                  width: 160.w,
                  child: Expanded(
                    child: ListTile(
                      title: Text(
                      price,
                        style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                      ),
                      subtitle: Text(
                        orginalprice,
                        style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12.sp,
                            color: Colors.grey),
                      ),
                      trailing: Icon(
                        Icons.add_shopping_cart_sharp,
                        color: Colors.blue,
                        size: 25.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
