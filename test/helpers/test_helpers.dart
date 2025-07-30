import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/data/models/auth_user/auth_user_dto.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/theme/app_theme.dart';
import 'package:megaviz_chat/src/l10n/app_localizations.dart';
import 'package:mockito/mockito.dart';

void provideMockitoDummies() {
  provideDummy<Either<AppException, AuthUser>>(
    Left(
      AppException(
        message: 'Dummy error',
        statusCode: 500,
        identifier: 'dummy_error',
      ),
    ),
  );

  provideDummy<Either<AppException, AuthUserDto>>(
    Left(
      AppException(
        message: 'Dummy error',
        statusCode: 500,
        identifier: 'dummy_error',
      ),
    ),
  );
}

void setupFirebaseCoreMocks() {
  // Mock Firebase Core
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/firebase_core'),
        (methodCall) async {
          switch (methodCall.method) {
            case 'Firebase#initializeCore':
              return [
                {
                  'name': '[DEFAULT]',
                  'options': {
                    'apiKey': 'test-api-key',
                    'appId': '1:1234567890:android:abc123def456',
                    'messagingSenderId': '1234567890',
                    'projectId': 'test-project',
                    'authDomain': 'test-project.firebaseapp.com',
                    'storageBucket': 'test-project.appspot.com',
                  },
                  'pluginConstants': <String, dynamic>{},
                },
              ];
            case 'Firebase#initializeApp':
              return <String, dynamic>{
                'name': '[DEFAULT]',
                'options': {
                  'apiKey': 'test-api-key',
                  'appId': '1:1234567890:android:abc123def456',
                  'messagingSenderId': '1234567890',
                  'projectId': 'test-project',
                  'authDomain': 'test-project.firebaseapp.com',
                  'storageBucket': 'test-project.appspot.com',
                },
                'pluginConstants': <String, dynamic>{},
              };
            default:
              return null;
          }
        },
      );

  // Mock Firebase Auth
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/firebase_auth'),
        (methodCall) async {
          switch (methodCall.method) {
            case 'Auth#registerIdTokenListener':
            case 'Auth#registerAuthStateListener':
              return <String, dynamic>{};
            default:
              return null;
          }
        },
      );

  // Mock Cloud Firestore
  TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
      .setMockMethodCallHandler(
        const MethodChannel('plugins.flutter.io/cloud_firestore'),
        (methodCall) async {
          return <String, dynamic>{};
        },
      );
}

Widget makeTestableWidget(Widget child) {
  return MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('en', 'US'),
      theme: AppTheme.getTheme(type: ThemeType.light),
      themeMode: ThemeMode.light,
      home: child,
    ),
  );
}
