import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_lifecycle_provider.g.dart';

@riverpod
class AppLifecycleProvider extends _$AppLifecycleProvider
    with WidgetsBindingObserver {
  @override
  AppLifecycleState build() {
    WidgetsBinding.instance.addObserver(this);
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
    });
    return AppLifecycleState.resumed;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
  }
}

class MockAppLifecycleProvider extends _$AppLifecycleProvider
    with Mock
    implements AppLifecycleProvider {}
