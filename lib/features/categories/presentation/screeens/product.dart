import 'package:caphore/features/categories/presentation/screeens/widgets/ImageSliderWithIndex.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productbotoom.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class product extends StatelessWidget {
  const product({super.key});

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
        iconTheme: const IconThemeData(color: Colors.blue),
        titleTextStyle: TextStyle(color: Colors.blue, fontSize: 22.sp),
        title: const Text("product name"),
      ),
      bottomNavigationBar: ProductBottom(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ImageSliderWithIndex(imeges: imeges),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "product name",
              style: TextStyle(fontSize: 20.sp, color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: const Color.fromARGB(255, 95, 95, 95),
              thickness: 1.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "decrebtion",
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ssssssssssssssssss\nsssssssssssssssss\nsssssssssss\nsssssssssss\nsssssssssss\nsssssssssss\nsssssssssss\n",
              style: TextStyle(
                  fontSize: 18.sp, color: Color.fromARGB(255, 73, 73, 73)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "you may like ",
              style: TextStyle(fontSize: 20.sp, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 200.h,
              width: double.infinity.w,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return const productcard();
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
