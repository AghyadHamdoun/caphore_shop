import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/routes.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context)  {
    return ScreenUtilInit(
      designSize: const Size(393, 786),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:const MyPages(),
          routes: MyRoutes.routes,
        );
      },
    );
  }
}
