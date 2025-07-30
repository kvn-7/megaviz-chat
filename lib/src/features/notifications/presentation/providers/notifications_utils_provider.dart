import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:megaviz_chat/src/features/router/app_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notifications_utils_provider.g.dart';

class AppNotificationsUtils {
  AppNotificationsUtils();

  Future<void> init(BuildContext context) async {
    await handleIntiMessage(context);
    await setupInteractedMessage();
    await handleForegroundNotification();
  }

  Future<void> handleIntiMessage(BuildContext context) async {
    await FirebaseMessaging.instance.requestPermission();

    final message = await FirebaseMessaging.instance.getInitialMessage();

    if (message == null) return;

    final metaData = message.data;

    if (!context.mounted) return;

    handleTap(metaData: metaData, context: context);
  }

  Future<void> setupInteractedMessage() async {
    await enableIOSNotifications();
    await registerNotificationListeners();
  }

  Future<void> handleForegroundNotification() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      try {} catch (e) {
        log(e.toString());
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      try {} catch (e) {
        log(e.toString());
      }
    });
  }

  Future<void> registerNotificationListeners() async {
    final channel = androidNotificationChannel();
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iOSSettings = DarwinInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iOSSettings,
    );
    await flutterLocalNotificationsPlugin.initialize(initSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      final notification = message!.notification;
      final android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              styleInformation: const BigTextStyleInformation(''),
            ),
          ),
        );
      }
    });
  }

  Future<void> enableIOSNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  AndroidNotificationChannel androidNotificationChannel() =>
      const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title
        importance: Importance.max,
      );

  void handleTap({
    required Map<String, dynamic> metaData,
    required BuildContext context,
  }) {
    // final chatId = metaData['chatId'] as String?;

    context.goNamed(AppRoutes.chat.name);
  }
}

@riverpod
class AppNotificationUtilsProvider extends _$AppNotificationUtilsProvider {
  @override
  AppNotificationsUtils build() {
    return AppNotificationsUtils();
  }
}
