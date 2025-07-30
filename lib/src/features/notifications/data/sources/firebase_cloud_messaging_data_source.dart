import 'dart:convert';
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/notifications/data/models/notification_dto.dart';
import 'package:dio/dio.dart';

class FirebaseCloudMessagingDataSource {
  final FirebaseMessaging _firebaseMessaging;
  final Dio _dio;

  FirebaseCloudMessagingDataSource()
    : _firebaseMessaging = FirebaseMessaging.instance,
      _dio = Dio(
        BaseOptions(
          baseUrl:
              'https://evetask.azurewebsites.net/api/megaviz', // Replace with your server URL
        ),
      );

  Future<String?> getFcmToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      return token;
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }

  Future<Either<AppException, bool>> sendPushNotification(
    SendNotificationDto notification,
  ) async {
    try {
      final response = await _dio.post(
        '/send-notification',
        options: Options(headers: {'Content-Type': 'application/json'}),
        data: jsonEncode({
          'title': notification.senderName,
          'body': notification.messageContent,
          'data': {'chatId': notification.chatId},
          'token': notification.recipientToken,
        }),
      );

      return Right(response.statusCode == 200);
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to send notification: $e',
          statusCode: 500,
          identifier: 'firebase_cloud_messaging_send_notification_error',
        ),
      );
    }
  }
}
