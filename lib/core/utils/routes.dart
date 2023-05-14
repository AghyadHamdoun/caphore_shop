import 'package:caphore/features/categories/presentation/screeens/Categories.dart';
import 'package:caphore/features/categories/presentation/screeens/OnBoarding/OBPage.dart';
import 'package:caphore/features/categories/presentation/screeens/SubCategorys.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/pages.dart';
import 'package:caphore/features/categories/presentation/screeens/search.dart';
import 'package:flutter/material.dart';

import '../../features/categories/presentation/screeens/home.dart';

class MyRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/Home": (context) => const Home(),
    "/Search": (context) => const Search(),
    "/Categories": (context) => const Categories(),
    "/subcategories": (context) => const subcategorys(
          name: '',
          image: '',
        ),
    "/OBPage": (context) => OBPage(),
    "/pages": (context) => const MyPages()
  };
}
