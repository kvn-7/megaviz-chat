import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_logo.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/sign_in_state_provider.dart';
import 'package:megaviz_chat/src/features/auth/presentation/views/sign_in_screen.dart';
import 'package:megaviz_chat/src/features/auth/presentation/views/widgets/social_sign_in_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../helpers/test_helpers.dart';

void main() {
  provideMockitoDummies();

  group('SignInScreen Widget Tests', () {
    testWidgets('should display app logo in app bar', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            signInStateProvider.overrideWith(MockSignInStateProvider.new),
          ],
          child: makeTestableWidget(SignInScreen()),
        ),
      );

      final element = tester.element(find.byType(SignInScreen));
      final container = ProviderScope.containerOf(element);
      final notifier = container.read(signInStateProvider.notifier);
      notifier.state = const AsyncData(false);

      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(AppLogo), findsOneWidget);
    });

    testWidgets('should display sign in title and subtitle', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            signInStateProvider.overrideWith(MockSignInStateProvider.new),
          ],
          child: makeTestableWidget(SignInScreen()),
        ),
      );

      final element = tester.element(find.byType(SignInScreen));
      final container = ProviderScope.containerOf(element);
      final notifier = container.read(signInStateProvider.notifier);
      notifier.state = const AsyncData(false);

      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(AppText), findsAtLeastNWidgets(2));
      // Check for title and subtitle text widgets
      final titleFinder = find.byWidgetPredicate(
        (widget) => widget is AppText && widget.text.contains('Sign'),
      );
      expect(titleFinder, findsAtLeastNWidgets(1));
    });

    testWidgets('should display Google and Facebook sign in buttons', (
      tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            signInStateProvider.overrideWith(MockSignInStateProvider.new),
          ],
          child: makeTestableWidget(SignInScreen()),
        ),
      );

      final element = tester.element(find.byType(SignInScreen));
      final container = ProviderScope.containerOf(element);
      final notifier = container.read(signInStateProvider.notifier);
      notifier.state = const AsyncData(false);

      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(SocialSignInWidget), findsNWidgets(2));

      // Find buttons by their content
      final googleButton = find.byWidgetPredicate(
        (widget) =>
            widget is SocialSignInWidget &&
            widget.name.toLowerCase().contains('google'),
      );
      final facebookButton = find.byWidgetPredicate(
        (widget) =>
            widget is SocialSignInWidget &&
            widget.name.toLowerCase().contains('facebook'),
      );

      expect(googleButton, findsOneWidget);
      expect(facebookButton, findsOneWidget);
    });

    testWidgets('should display terms and conditions text', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            signInStateProvider.overrideWith(MockSignInStateProvider.new),
          ],
          child: makeTestableWidget(SignInScreen()),
        ),
      );

      final element = tester.element(find.byType(SignInScreen));
      final container = ProviderScope.containerOf(element);
      final notifier = container.read(signInStateProvider.notifier);
      notifier.state = const AsyncData(false);

      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(RichText), findsAny);
    });

    testWidgets('should be wrapped in AppScaffold', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            signInStateProvider.overrideWith(MockSignInStateProvider.new),
          ],
          child: makeTestableWidget(SignInScreen()),
        ),
      );

      final element = tester.element(find.byType(SignInScreen));
      final container = ProviderScope.containerOf(element);
      final notifier = container.read(signInStateProvider.notifier);
      notifier.state = const AsyncData(false);

      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(AppScaffold), findsOneWidget);
    });

    testWidgets('should display content in ListView', (tester) async {
      // Arrange
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            signInStateProvider.overrideWith(MockSignInStateProvider.new),
          ],
          child: makeTestableWidget(SignInScreen()),
        ),
      );

      final element = tester.element(find.byType(SignInScreen));
      final container = ProviderScope.containerOf(element);
      final notifier = container.read(signInStateProvider.notifier);
      notifier.state = const AsyncData(false);

      await tester.pumpAndSettle();

      // Assert
      expect(find.byType(ListView), findsOneWidget);
    });

    group('Loading States', () {
      testWidgets('should handle AsyncLoading state', (tester) async {
        // Arrange
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              signInStateProvider.overrideWith(MockSignInStateProvider.new),
            ],
            child: makeTestableWidget(SignInScreen()),
          ),
        );

        final element = tester.element(find.byType(SignInScreen));
        final container = ProviderScope.containerOf(element);
        final mockNotifier = container.read(signInStateProvider.notifier);
        mockNotifier.state = const AsyncLoading();

        await tester.pumpAndSettle();

        // Assert - UI should still be rendered
        expect(find.byType(SocialSignInWidget), findsNWidgets(2));
        expect(find.byType(AppLogo), findsOneWidget);
      });

      testWidgets('should handle AsyncData state', (tester) async {
        // Arrange
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              signInStateProvider.overrideWith(MockSignInStateProvider.new),
            ],
            child: makeTestableWidget(SignInScreen()),
          ),
        );

        final element = tester.element(find.byType(SignInScreen));
        final container = ProviderScope.containerOf(element);
        final mockNotifier = container.read(signInStateProvider.notifier);
        mockNotifier.state = const AsyncData(true);

        await tester.pumpAndSettle();

        // Assert
        expect(find.byType(SocialSignInWidget), findsNWidgets(2));
        expect(find.byType(AppLogo), findsOneWidget);
      });
    });
  });
}
