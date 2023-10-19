import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackground(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationUtils()._showLocalNotification(message);

  print(" background message: ${message.messageId}");
}

class NotificationUtils {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await firebaseMessaging.requestPermission(
      alert: true,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackground);
    _onMessageListenMethod();
    _onMessageOpenedApp();
  }

  _showLocalNotification(RemoteMessage message) async {
    flutterLocalNotificationsPlugin.show(
      1234,
      message.notification?.title,
      message.notification?.body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          "1234",
          "Notification",
          channelDescription: "App Notification",
          importance: Importance.max,
          playSound: true,
          showProgress: true,
          priority: Priority.high,
        ),
      ),
    );
  }

  void _onMessageListenMethod() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      _showLocalNotification(message);
    });
  }

  void _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
  }
}
