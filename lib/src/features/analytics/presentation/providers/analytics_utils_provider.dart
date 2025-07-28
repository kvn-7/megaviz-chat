import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:megaviz_chat/src/features/router/app_router.dart';

part 'analytics_utils_provider.g.dart';

class AnalyticsUtils {
  AnalyticsUtils({required this.ref});

  final Ref ref;

  void setUserId(String? userId) {
    try {
      // _analytics.setUserId(id: userId);
    } catch (e) {
      log('Failed to set user id: $userId', error: e);
    }
  }

  void logEvent(String name, Map<String, dynamic>? parameters) {
    try {
      log('Logging event: $name, parameters: $parameters');
      // _analytics.logEvent(
      //   name: name,
      //   parameters: parameters?.map(
      //     (key, value) => MapEntry(key, value.toString()),
      //   ),
      // );
    } catch (e) {
      log('Failed to log event: $name', error: e);
    }
  }

  void screenView(String screenName) {
    logEvent('screen_view', {'screen_name': screenName});
  }

  void buttonClick(String buttonName) {
    final screenName = ref
        .read(appRouterProvider)
        .routerDelegate
        .currentConfiguration
        .lastOrNull
        ?.route
        .name;

    logEvent('button_click', {
      'button_name': buttonName,
      if (screenName != null) 'screen_name': screenName,
    });
  }

  void error(String error, String? action, String? screenName) {
    logEvent('error', {
      'error': error,
      if (action != null) 'action': action,
      if (screenName != null) 'screen_name': screenName,
    });
  }
}

class AnalyticsButtonName {}

class AnalyticsScreenName {}

class AnalyticsAction {}

@riverpod
class AnalyticsUtilsProvider extends _$AnalyticsUtilsProvider {
  @override
  AnalyticsUtils build() {
    return AnalyticsUtils(ref: ref);
  }
}
