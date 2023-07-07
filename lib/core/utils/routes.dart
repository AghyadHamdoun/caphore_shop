import 'package:caphore/features/categories/presentation/screeens/pages/stores.dart';
import 'package:caphore/features/categories/presentation/screeens/sub_categories.dart';
import 'package:caphore/features/categories/presentation/screeens/pages/pages.dart';
import 'package:caphore/features/categories/presentation/screeens/search/search.dart';
import 'package:caphore/features/welcome/presentation/OnBoarding/OBPage.dart';
import 'package:flutter/material.dart';

import '../../features/categories/presentation/screeens/pages/home.dart';

class MyRoutes {
  static Map<String, WidgetBuilder> routes = {
    "/Home": (context) => const Home(),
    "/Search": (context) => const Search(),
    "/Stores": (context) => const Stores(),
    "/OBPage": (context) => OBPage(),
    "/pages": (context) => const MyPages()
  };
}
