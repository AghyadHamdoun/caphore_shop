// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_color.dart';

class LegalPageWidget extends StatelessWidget {
  final String svgpath;
  final String name;
  GestureTapCallback gotopage;
  LegalPageWidget({
    Key? key,
    required this.svgpath,
    required this.name,
    required this.gotopage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: InkWell(
        onTap: gotopage,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w),
                  child: SvgPicture.asset(
                    svgpath,
                    color: AppColor.accentColor,
                    height: 25.h,
                    width: 20.w,
                  ),
                ),
                Text(name, style: TextStyle(fontSize: 17.sp)),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 26.r,
                color: AppColor.accentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
