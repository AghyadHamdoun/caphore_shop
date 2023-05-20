import 'package:caphore/features/categories/presentation/screeens/controlpanel/terms_and_conditions.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/categories.dart';
import 'package:caphore/features/categories/presentation/screeens/OnBoarding/OBPage.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/home.dart';
import 'package:caphore/features/categories/presentation/screeens/sub_categories.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/pages.dart';
import 'package:caphore/features/categories/presentation/screeens/search.dart';
import 'package:flutter/material.dart';


class MyRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/Home": (context) => const Home(),
    "/Search": (context) => const Search(),
    "/Categories": (context) => const Categories(),
    "/subcategories": (context) => const subcategorys(
          name: '',
          image: '',
        ),
    "/OBPage": (context) => const OBPage(),
    "/pages": (context) => const MyPages(),
    "/terms": (context) => const TermsAndConditions()

  };
}
