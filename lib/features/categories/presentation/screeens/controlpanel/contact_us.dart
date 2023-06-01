
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_html_css/simple_html_css.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String html = '''<p style="text-align: center;"><strong>للتواصل معنا عن طريق الاتصال أو الواتس :</strong></p>
<p style="text-align: center;"><strong>00963941191155</strong></p>
<p style="text-align: center;"><strong>أو عن طريق الهاتف الأرضي :</strong></p>
<p style="text-align: center;"><strong>  </strong><strong>021</strong><strong>2668119</strong></p>
<p style="text-align: center;"><strong>أو عن طريق علامة الواتس الظاهرة في الزاوية اليمنى السفلى من الموقع</strong></p>
<p style="text-align: center;"><strong>caphore.mall@gmail.com</strong></p>''';
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 10.h),
            child: RichText(
              text: HTML.toTextSpan(context,html),
              //...
            ),
          ),
        ),
      ),
    );
  }
}
