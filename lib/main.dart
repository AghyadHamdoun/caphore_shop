import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:caphore/core/network/injection.dart';
import 'package:caphore/core/services/services_locator.dart';
import 'package:caphore/core/utils/prefrences.dart';
import 'package:caphore/core/utils/routes.dart';
import 'package:caphore/features/notification/firebase_api.dart';
import 'package:caphore/features/welcome/presentation/OnBoarding/Splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


void main() async {
  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);
  ServicesLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Preferences.init();
  injection.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
// BackgroundFetch.registerHeadlessTask(backgroundFetchCallback);
  await Firebase.initializeApp();
  await FirebaseApi().initNotifications();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('ar', 'SA')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar', 'SA'),
      child: const MyApp()));
}

// Future<void> openSignalRConnection() async {
//   final connection = HubConnectionBuilder()
//       .withUrl(
//           'ws://62.72.29.95:5033/hubs/MobileNotifications',
//           HttpConnectionOptions(
//             skipNegotiation: true,
//             transport: HttpTransportType.webSockets,
//             logging: (level, message) => print(message),
//           ))
//       .build();
//
//   await connection.start();
//
//   connection.on('New', (message) {
//     print(message);
//     print('aghyad');
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//             id: 10,
//             channelKey: 'basic_channel',
//             title: message![0]['title'],
//             body: message[0]['body']));
//   });
// }
// // @pragma('vm:entry-point')
// void backgroundFetchCallback(String taskId) async {
//   print('aghyad1') ;
//   // await openSignalRConnection();
//   // print('aghyad2');
//
//   BackgroundFetch.finish(taskId);
// }

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
@override
  void initState() {
  AwesomeNotifications().isNotificationAllowed().then((value) {
    if (!value) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    }
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 786),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          theme: ThemeData(textTheme: GoogleFonts.notoNaskhArabicTextTheme()),
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          home: Splash(),
          routes: MyRoutes.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
