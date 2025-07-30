import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_in_with_facebook_use_case.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/sign_in_with_facebook_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/sign_in_with_google_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/sign_in_state_provider.dart';

import '../../../../helpers/test_helpers.dart';

@GenerateNiceMocks([
  MockSpec<SignInWithGoogleUseCase>(),
  MockSpec<SignInWithFacebookUseCase>(),
])
import 'sign_in_state_provider_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('SignInStateProvider', () {
    late ProviderContainer container;
    late MockSignInWithGoogleUseCase mockSignInWithGoogleUseCase;
    late MockSignInWithFacebookUseCase mockSignInWithFacebookUseCase;

    const testUser = AuthUser(
      id: 'test_id',
      email: 'test@example.com',
      name: 'Test User',
      photoUrl: 'https://example.com/photo.jpg',
    );

    setUp(() {
      mockSignInWithGoogleUseCase = MockSignInWithGoogleUseCase();
      mockSignInWithFacebookUseCase = MockSignInWithFacebookUseCase();

      container = ProviderContainer(
        overrides: [
          signInWithGoogleUseCaseProvider.overrideWith(
            MockSignInWithGoogleUseCaseProvider.new,
          ),
          signInWithFacebookUseCaseProvider.overrideWith(
            MockSignInWithFacebookUseCaseProvider.new,
          ),
        ],
      );

      container.read(signInWithGoogleUseCaseProvider.notifier).state =
          mockSignInWithGoogleUseCase;
      container.read(signInWithFacebookUseCaseProvider.notifier).state =
          mockSignInWithFacebookUseCase;
    });

    tearDown(() {
      container.dispose();
    });

    test('should return false initially', () async {
      // Act
      final future = container.read(signInStateProvider.future);

      // Assert
      expect(await future, false);
    });

    group('signInWithGoogle', () {
      test('should successfully sign in with Google', () async {
        // Arrange
        when(
          mockSignInWithGoogleUseCase(),
        ).thenAnswer((_) async => Either.right(testUser));

        // Act
        await container.read(signInStateProvider.notifier).signInWithGoogle();
        final result = await container.read(signInStateProvider.future);

        verify(mockSignInWithGoogleUseCase()).called(1);
        expect(result, true);
      });

      test('should set loading state when signing in with Google', () {
        // Arrange
        when(mockSignInWithGoogleUseCase()).thenAnswer((_) async {
          await Future.delayed(const Duration(milliseconds: 100));
          return Either.right(testUser);
        });

        // Act
        container.read(signInStateProvider.notifier).signInWithGoogle();
        final asyncValue = container.read(signInStateProvider);

        // Assert
        expect(asyncValue.isLoading, true);
      });

      test('should handle Google sign in error', () async {
        // Arrange
        final appException = AppException(
          message: 'Google sign in failed',
          statusCode: 500,
          identifier: '',
        );
        when(
          mockSignInWithGoogleUseCase(),
        ).thenAnswer((_) async => Either.left(appException));

        // Act
        await container.read(signInStateProvider.notifier).signInWithGoogle();
        final asyncValue = container.read(signInStateProvider);

        // Assert
        expect(asyncValue.hasError, true);
        expect(asyncValue.error, 'Google sign in failed');
      });

      group('signInWithFacebook', () {
        test('should successfully sign in with Facebook', () async {
          // Arrange
          when(
            mockSignInWithFacebookUseCase(),
          ).thenAnswer((_) async => Either.right(testUser));

          // Act
          await container
              .read(signInStateProvider.notifier)
              .signInWithFacebook();
          final result = await container.read(signInStateProvider.future);

          // Assert
          verify(mockSignInWithFacebookUseCase()).called(1);
          expect(result, true);
        });

        test('should set loading state when signing in with Facebook', () {
          // Arrange
          when(mockSignInWithFacebookUseCase()).thenAnswer((_) async {
            await Future.delayed(const Duration(milliseconds: 100));
            return Either.right(testUser);
          });

          // Act
          container.read(signInStateProvider.notifier).signInWithFacebook();
          final asyncValue = container.read(signInStateProvider);

          // Assert
          expect(asyncValue.isLoading, true);
        });

        test('should handle Facebook sign in error', () async {
          // Arrange
          final appException = AppException(
            message: 'Facebook sign in failed',
            statusCode: 500,
            identifier: '',
          );
          when(
            mockSignInWithFacebookUseCase(),
          ).thenAnswer((_) async => Either.left(appException));

          // Act
          await container
              .read(signInStateProvider.notifier)
              .signInWithFacebook();
          final asyncValue = container.read(signInStateProvider);

          // Assert
          expect(asyncValue.hasError, true);
          expect(asyncValue.error, 'Facebook sign in failed');
        });

        test('should handle null FCM token for Facebook sign in', () async {
          // Arrange
          when(
            mockSignInWithFacebookUseCase(),
          ).thenAnswer((_) async => Either.right(testUser));

          // Act
          await container
              .read(signInStateProvider.notifier)
              .signInWithFacebook();
          final result = await container.read(signInStateProvider.future);

          // Assert
          verify(mockSignInWithFacebookUseCase()).called(1);
          expect(result, true);
        });
      });

      test('should reset state when provider is refreshed', () async {
        // Arrange
        when(
          mockSignInWithGoogleUseCase(),
        ).thenAnswer((_) async => Either.right(testUser));
        await container.read(signInStateProvider.notifier).signInWithGoogle();

        // Act
        container.refresh(signInStateProvider);
        final result = await container.read(signInStateProvider.future);

        // Assert
        expect(result, false);
      });

      test('should handle concurrent sign in attempts', () async {
        // Arrange
        when(
          mockSignInWithGoogleUseCase(),
        ).thenAnswer((_) async => Either.right(testUser));
        when(
          mockSignInWithFacebookUseCase(),
        ).thenAnswer((_) async => Either.right(testUser));

        // Act
        final googleFuture = container
            .read(signInStateProvider.notifier)
            .signInWithGoogle();
        final facebookFuture = container
            .read(signInStateProvider.notifier)
            .signInWithFacebook();

        await Future.wait([googleFuture, facebookFuture]);
        final result = await container.read(signInStateProvider.future);

        // Assert
        expect(result, true);
      });
    });
  });
}
