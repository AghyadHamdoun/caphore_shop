import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class categoryproducts extends StatefulWidget {
  const categoryproducts({super.key});

  @override
  State<categoryproducts> createState() => _categoryproductsState();
}

class _categoryproductsState extends State<categoryproducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 30.h, left: 0, right: 0, bottom: 10.h),
              child: const maintextform(),
            ),
            Container(
              height: 150.h,
              width: 370.w,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1564419320461-6870880221ad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const Text("category name"),
            SizedBox(
              height: 10.h,
            ),
            const Text(
                "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8.h),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(productname: productname, price: price, orginalprice: orginalprice);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
