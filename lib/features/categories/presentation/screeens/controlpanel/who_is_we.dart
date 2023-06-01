import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_html_css/simple_html_css.dart';

class WhoIsWe extends StatelessWidget {
  const WhoIsWe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String html = '''<p>عن&nbsp; <span style="color: #ffcc00;"><strong>كافور</strong></span></p>
<p>&nbsp;<strong>موقع </strong><span style="color: #ffcc00;"><strong>كافور</strong></span><strong><span style="color: #ffcc00;">&nbsp;</span>هو موقع وسيط الكتروني تُعنى بالتسوق عبر الإنترنت<br></strong>&nbsp;<span style="color: #ffcc00;"><strong>كافور&nbsp;</strong></span><strong>هو اسم شجرة يستخرج منها مواد تستخدم في كثير من الأدوية والمنتجات الصحية</strong> <br><strong>مشروع موقع&nbsp;</strong><span style="color: #ffcc00;"><strong>كافور</strong></span><strong><span style="color: #ffcc00;">&nbsp;</span>يواكب حداثة وتطور هذا العصر ويهدف إلى تأمين جميع الاحتياجات مع القدرة على المقارنة بين المنتجات ومن ثم الشراء عبر الإنترنت</strong><strong>.</strong> <strong>&nbsp;</strong><strong>ما هي فكره موقع </strong><span style="color: #ffcc00;"><strong>كافور</strong></span><strong>:</strong> <br><strong>هو وسيط الكتروني يسمح لك أن تشتري ماتريد أين ماكنت في سوريا و طريقة الشراء سهلة و مضمونة و أمنة 100%</strong> <strong>وذلك حين شرائك أي منتج مهما كان , سيكون التواصل مع صاحب الشركة أو المحل التجاري مالك ذلك المنتج عن طريق الوتس أب و يمكنك السؤال عن السعر اذا لم يكن موجود كما يوجد خصم عند شرائك من موقع </strong><span style="color: #ffcc00;"><strong>كافور</strong></span> <span style="color: #ffcc00;"><strong>كافور</strong></span><strong> سيجعل تسوقك سهل وستجد أي شي أنت بحاجته من منتجات وخدمات ومطاعم</strong> <strong>&nbsp;</strong><strong>&nbsp;</strong></p>''';
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
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
