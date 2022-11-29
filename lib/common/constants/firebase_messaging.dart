import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:padie_mobile/src/controllers/profile_controller.dart';
import 'package:padie_mobile/src/services/auth/shared_prefernces.dart';



class MessageFromFirebaseHandling {
  late FirebaseMessaging messaging;
  Preferences prefs = Preferences();
  MessageFromFirebaseHandling.init(Ref ref) {
    getToken(ref);
  }
  getToken(Ref read) async {
    messaging = FirebaseMessaging.instance;
    String? fcmToken1 = await (messaging.getToken());
    debugPrint("fcm: $fcmToken1");
    prefs.setFCMToken(fcmToken1!);
    String? token = await prefs.getToken();
    String? fcmToken = await prefs.getFCMToken();
    if (token != null) {
      read.read(profileControllerProvider.notifier)
          .updatePersonalProfile(json: {"fcm_token": fcmToken});
    }
  }

  static const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description: 'This channel is used for important notifications.', // description,
    importance: Importance.max,
    // sound: ,
  );

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> resolvePlatform() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) async {
      debugPrint("message received");
      RemoteNotification? notification = event.notification;
      AndroidNotification? android = event.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        await flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channelDescription: channel.description,
                icon: '@drawable/logo',
                // other properties...
              ),
            ));
      }
    });
  }

  onMessageOpened() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      debugPrint("message received");
    });
  }
}
