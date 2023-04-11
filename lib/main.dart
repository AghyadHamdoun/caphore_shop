import 'package:caphore/presentation/screens/Categorys.dart';
import 'package:caphore/presentation/screens/SubCategorys.dart';
import 'package:caphore/presentation/screens/categoryproducts.dart';
import 'package:caphore/presentation/screens/product.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:caphore/presentation/screens/home.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 786),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const Home(),
          routes: {
            "Home": (context) => const Home(),
            "Categorys": (context) => const Categorys(),
            "categoryproducts": (context) => const categoryproducts(),
            "product": (context) => const product(),
            "subcategorys": (context) => const subcategorys(),
          },
        );
      },
    );
  }
}
