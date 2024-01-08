import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
 final firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await firebaseMessaging.requestPermission(
    );
    await firebaseMessaging.subscribeToTopic('All');
    print('Subscribed to channel_All');
    FirebaseMessaging.onMessage.listen((event) {
      final notification = event.notification;
      if (notification == null) {
        return;
      }
      AwesomeNotifications().createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: 'basic_channel',
              title: notification.title,
              body: notification.body));
    });
  }
}
