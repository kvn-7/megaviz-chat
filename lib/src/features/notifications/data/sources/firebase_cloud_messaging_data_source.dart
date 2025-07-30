import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseCloudMessagingDataSource {
  final FirebaseMessaging _firebaseMessaging;

  FirebaseCloudMessagingDataSource()
    : _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getFcmToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      return token;
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }
}
