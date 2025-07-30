import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/app_lifecycle_provider.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  provideMockitoDummies();

  group('AppLifecycleProvider', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() async {
      container.dispose();
      // Allow pending timers to complete
      await Future.delayed(Duration.zero);
    });

    testWidgets('should initialize with resumed state', (tester) async {
      // Arrange & Act
      final state = container.read(appLifecycleProvider);

      // Assert
      expect(state, AppLifecycleState.resumed);

      // Pump and settle to handle any pending timers
      await tester.pumpAndSettle();
    });

    testWidgets('should update state when app lifecycle changes', (
      tester,
    ) async {
      // Arrange
      final provider = container.read(appLifecycleProvider.notifier);

      // Act
      provider.didChangeAppLifecycleState(AppLifecycleState.paused);

      // Assert
      expect(container.read(appLifecycleProvider), AppLifecycleState.paused);

      // Pump and settle to handle any pending timers
      await tester.pumpAndSettle();
    });

    testWidgets('should handle multiple lifecycle state changes', (
      tester,
    ) async {
      // Arrange
      final provider = container.read(appLifecycleProvider.notifier);
      final states = <AppLifecycleState>[];

      container.listen(appLifecycleProvider, (previous, next) {
        states.add(next);
      });

      // Act
      provider.didChangeAppLifecycleState(AppLifecycleState.inactive);
      provider.didChangeAppLifecycleState(AppLifecycleState.paused);
      provider.didChangeAppLifecycleState(AppLifecycleState.resumed);

      // Assert
      expect(states, [
        AppLifecycleState.inactive,
        AppLifecycleState.paused,
        AppLifecycleState.resumed,
      ]);

      // Pump and settle to handle any pending timers
      await tester.pumpAndSettle();
    });

    testWidgets('should handle detached state', (tester) async {
      // Arrange
      final provider = container.read(appLifecycleProvider.notifier);

      // Act
      provider.didChangeAppLifecycleState(AppLifecycleState.detached);

      // Assert
      expect(container.read(appLifecycleProvider), AppLifecycleState.detached);

      // Pump and settle to handle any pending timers
      await tester.pumpAndSettle();
    });
  });
}
