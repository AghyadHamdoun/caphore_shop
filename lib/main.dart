import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/routes.dart';
import 'package:caphore/features/categories/data/models/products_model.dart';
import 'package:caphore/features/categories/presentation/screeens/OnBoarding/Splash.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  check();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar', 'SA')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'SA'),
      child: const MyApp()));
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
          theme: ThemeData(textTheme: GoogleFonts.notoNaskhArabicTextTheme()),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: const Splash(),
          routes: MyRoutes.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}

Future<List<CategoriesModel>> check() async {
  print('request----------');
  List<CategoriesModel> response = (await Dio().get(
          "https://www.caphore.sy/wp-json/wc/v3/products/categories?consumer_key=ck_91cf0556bc93906395a13037c2a179392cb49b58&consumer_secret=cs_3fe564c516e38ed51dcd7caef07c95baadc4f294&parent=0"))
      as List<CategoriesModel>;
  print(
      "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  print(response);
  return response;
}
