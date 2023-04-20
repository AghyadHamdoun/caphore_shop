import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/categories/presentation/screeens/Categorys.dart';
import 'package:caphore/features/categories/presentation/screeens/SubCategorys.dart';
import 'package:caphore/features/categories/presentation/screeens/categoryproducts.dart';
import 'package:caphore/features/categories/presentation/screeens/home.dart';
import 'package:caphore/features/categories/presentation/screeens/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    List pages = [
      const Home(),
      const Categorys(),
    ];
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
          home: Scaffold(
            body: pages[currentPage],
            bottomNavigationBar: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: "categories",
                ),
              ],
              currentIndex: currentPage,
              onTap: (index){
                currentPage=index;
              },
              selectedFontSize: 16.sp,
              selectedIconTheme: IconThemeData(size: 30.r),
              unselectedFontSize: 12.sp,
              unselectedIconTheme: IconThemeData(size: 23.r),
            ),
          ),
          routes: {
            "/Home": (context) => const Home(),
            "/Categories": (context) => const Categorys(),
            "/CategoryProducts": (context) => const categoryproducts(),
            "product": (context) => const product(),
            "/subcategories": (context) => const subcategorys(),
          },
        );
      },
    );
  }
}
