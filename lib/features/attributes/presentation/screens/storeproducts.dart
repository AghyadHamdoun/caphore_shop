import 'package:cached_network_image/cached_network_image.dart';
import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/screens/components/store_products_component.dart';
import 'package:caphore/features/categories/presentation/screeens/widgets/textformfild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_color.dart';

class StoreProducts extends StatelessWidget {
  final AttributesEvent event;
  final String storeName;
  final String image;

  const StoreProducts(
      {super.key,
      required this.event,
      required this.storeName,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<AttributesBloc>()..add(event),
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 10.h),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.h),
                    child: const maintextform(),
                  ),
                  Expanded(
                    child: SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: image,
                                errorWidget: (context, url, error) =>
                                    Image.network(image),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const TermProductComponent()
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
