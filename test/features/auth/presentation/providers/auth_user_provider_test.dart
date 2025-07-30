import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/get_auth_user_stream_use_case.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/get_auth_user_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/get_auth_user_stream_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/get_auth_user_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/auth_user_provider.dart';

import '../../../../helpers/test_helpers.dart';

@GenerateNiceMocks([
  MockSpec<GetAuthUserUseCase>(),
  MockSpec<GetAuthUserStreamUseCase>(),
])
import 'auth_user_provider_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('AuthUserProvider', () {
    late ProviderContainer container;
    late MockGetAuthUserUseCase mockGetAuthUserUseCase;
    late MockGetAuthUserStreamUseCase mockGetAuthUserStreamUseCase;

    const testUser = AuthUser(
      id: 'test_id',
      email: 'test@example.com',
      name: 'Test User',
      photoUrl: 'https://example.com/photo.jpg',
    );

    setUp(() {
      mockGetAuthUserUseCase = MockGetAuthUserUseCase();
      mockGetAuthUserStreamUseCase = MockGetAuthUserStreamUseCase();

      container = ProviderContainer(
        overrides: [
          getAuthUserStreamUseCaseProvider.overrideWith(
            MockGetAuthUserStreamUseCaseProvider.new,
          ),
          getAuthUserUseCaseProvider.overrideWith(
            MockGetAuthUserUseCaseProvider.new,
          ),
        ],
      );

      container.read(getAuthUserStreamUseCaseProvider.notifier).state =
          mockGetAuthUserStreamUseCase;

      container.read(getAuthUserUseCaseProvider.notifier).state =
          mockGetAuthUserUseCase;
    });

    tearDown(() {
      container.dispose();
    });

    test(
      'should return null initially when no user is authenticated',
      () async {
        // Arrange
        when(mockGetAuthUserUseCase.call()).thenAnswer((_) async => null);
        when(
          mockGetAuthUserStreamUseCase.call(),
        ).thenAnswer((_) => Stream.value(null));

        // Act
        final future = container.read(authUserProvider.future);

        // Assert
        expect(await future, null);
      },
    );

    test('should return AuthUser when user is authenticated', () async {
      // Arrange
      when(mockGetAuthUserUseCase()).thenAnswer((_) async => testUser);
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => Stream.value(testUser));

      // Act
      final future = container.read(authUserProvider.future);

      // Assert
      expect(await future, testUser);
    });

    test('should listen to auth user stream', () async {
      // Arrange
      when(mockGetAuthUserUseCase()).thenAnswer((_) async => null);
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => Stream.value(testUser));

      // Act
      await container.read(authUserProvider.future);

      // Assert
      verify(mockGetAuthUserStreamUseCase()).called(1);
      expect(container.read(authUserProvider).value, testUser);
    });

    test('should listen to auth user stream', () async {
      // Arrange
      when(mockGetAuthUserUseCase()).thenAnswer((_) async => null);
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => Stream.value(testUser));

      // Act
      await container.read(authUserProvider.future);

      // Assert
      verify(mockGetAuthUserStreamUseCase()).called(1);
      expect(container.read(authUserProvider).value, testUser);
    });

    test('should handle stream errors gracefully', () async {
      // Arrange
      final exception = Exception('Authentication error');
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => Stream.error(exception));

      // Act & Assert
      expect(
        container.read(authUserProvider.future),
        throwsA(isA<Exception>()),
      );
    });

    test('should update when auth state changes', () async {
      // Arrange
      final streamController = StreamController<AuthUser?>();
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => streamController.stream);

      // Act
      final provider = container.listen(authUserProvider, (previous, next) {});

      // Emit null (logged out)
      streamController.add(null);
      await Future.delayed(Duration.zero);

      expect(container.read(authUserProvider).value, null);

      // Emit user (logged in)
      streamController.add(testUser);
      await Future.delayed(Duration.zero);

      expect(container.read(authUserProvider).value, testUser);

      // Cleanup
      streamController.close();
      provider.close();
    });

    test('should handle multiple stream emissions', () async {
      // Arrange
      final streamController = StreamController<AuthUser?>();
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => streamController.stream);

      final emittedValues = <AuthUser?>[];
      final provider = container.listen<AsyncValue<AuthUser?>>(
        authUserProvider,
        (previous, next) {
          if (next is AsyncData) {
            emittedValues.add(next.value);
          }
        },
      );

      // Act
      streamController.add(null);
      await Future.delayed(Duration.zero);

      streamController.add(testUser);
      await Future.delayed(Duration.zero);

      const updatedUser = AuthUser(
        id: 'updated_id',
        email: 'updated@example.com',
        name: 'Updated User',
        photoUrl: 'https://example.com/updated_photo.jpg',
      );
      streamController.add(updatedUser);
      await Future.delayed(Duration.zero);

      // Assert
      expect(emittedValues, [null, testUser, updatedUser]);

      // Cleanup
      streamController.close();
      provider.close();
    });

    test('should recreate stream when provider is refreshed', () async {
      // Arrange
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => Stream.value(testUser));

      // Act - First read
      await container.read(authUserProvider.future);

      // Refresh the provider
      container.refresh(authUserProvider);
      await container.read(authUserProvider.future);

      // Assert
      verify(mockGetAuthUserStreamUseCase()).called(2);
    });

    test('should handle null user in stream', () async {
      // Arrange
      final streamController = StreamController<AuthUser?>();
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => streamController.stream);

      // Act
      final provider = container.listen(authUserProvider, (previous, next) {});

      streamController.add(null);
      await Future.delayed(Duration.zero);

      // Assert
      expect(container.read(authUserProvider).value, null);
      expect(container.read(authUserProvider).hasValue, true);

      // Cleanup
      streamController.close();
      provider.close();
    });

    test('should maintain loading state during stream initialization', () {
      // Arrange
      final streamController = StreamController<AuthUser?>();
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => streamController.stream);

      // Act
      final asyncValue = container.read(authUserProvider);

      // Assert
      expect(asyncValue.isLoading, true);
      expect(asyncValue.hasValue, false);

      // Cleanup
      streamController.close();
    });

    test('should handle rapid state changes', () async {
      // Arrange
      final streamController = StreamController<AuthUser?>();
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => streamController.stream);

      final receivedValues = <AuthUser?>[];
      final provider = container.listen<AsyncValue<AuthUser?>>(
        authUserProvider,
        (previous, next) {
          if (next is AsyncData) {
            receivedValues.add(next.value);
          }
        },
      );

      // Act - Rapid emissions
      streamController.add(null);
      streamController.add(testUser);
      streamController.add(null);
      streamController.add(testUser);

      await Future.delayed(Duration.zero);

      // Assert
      expect(receivedValues.last, testUser);
      expect(container.read(authUserProvider).value, testUser);

      // Cleanup
      streamController.close();
      provider.close();
    });

    test('should handle stream that never emits', () {
      // Arrange
      final streamController = StreamController<AuthUser?>();
      when(
        mockGetAuthUserStreamUseCase(),
      ).thenAnswer((_) => streamController.stream);

      // Act
      final asyncValue = container.read(authUserProvider);

      // Assert
      expect(asyncValue.isLoading, true);
      expect(asyncValue.hasError, false);
      expect(asyncValue.hasValue, false);

      // Cleanup
      streamController.close();
    });
  });
}
