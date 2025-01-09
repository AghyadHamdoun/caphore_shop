import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_bloc.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_event.dart';
import 'package:caphore/features/attributes/presentation/controller/attributes_state.dart';
import 'package:caphore/features/attributes/presentation/screens/storeproducts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSliderTwoWithIndex extends StatelessWidget {
  const ImageSliderTwoWithIndex({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var bloc = sl<AttributesBloc>();
    return BlocProvider(
      create: (context) => bloc
        ..add(const GetBannersTermsEvent(
            pageNum: 1, attributeId: 34, perPage: 100)),
      child: BlocBuilder<AttributesBloc, AttributesState>(
        builder: (context, state) {
          List<String> images = [];
          List<String> attributeName = [];
          List<String> termId = [];
          if (state.bannersTerms.isNotEmpty) {
            List<String> banners = state.bannersTerms[1].description.split(';');
            for (int i = 0; i < banners.length; i += 3) {
              images.add(banners[i]);
              attributeName.add(banners[i + 1]);
              termId.add(banners[i + 2]);
            }
          }
          CarouselController carouselController = CarouselController(
            initialItem: 0,
          );
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: SizedBox(
              height: size.height / 4,
              child: CarouselView(
                onTap: (index) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreProducts(
                        attribute: attributeName[index],
                        termid: int.parse(termId[index]),
                        event: GetTermProductsEvent(
                            attribute: attributeName[index],
                            termId: int.parse(termId[index]),
                            perPage: 20,
                            pageNum: 1),
                        storeName: 'المطاعم',
                        image: images[index],
                      ),
                    ),
                  );
                },
                itemExtent: size.width / 1.2,
                itemSnapping: true,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(5.h),
                controller: carouselController,
                elevation: 5,
                children: List.generate(
                  images.length,
                  (int index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
