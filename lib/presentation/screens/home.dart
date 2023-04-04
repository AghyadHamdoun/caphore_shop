import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/utils/app_color.dart';
import '../widgets/salesavatar.dart';
import '../widgets/textformfild.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: maintextform(),
          ),
          SizedBox(
            height: 144.h,
            width: 100.w,
            child: Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return const salesavatar();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("new products"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "show all >",
                      style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 190.h,
              width: double.infinity.w,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
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
                                      borderRadius:
                                          BorderRadius.circular(20.r)),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: Text(
                                  "productname",
                                  style: TextStyle(fontSize: 16.sp),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              width: 80.w,
                              child: Expanded(
                                child: ListTile(
                                  title: Text(
                                    "price",
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.blue),
                                  ),
                                  subtitle: Text(
                                    "orginal price",
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 12.sp,
                                        color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
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
