import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/sign_out_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/sign_out_state_provider.dart';

import '../../../../helpers/test_helpers.dart';

@GenerateNiceMocks([MockSpec<SignOutUseCase>()])
import 'sign_out_state_provider_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('SignOutStateProvider', () {
    late ProviderContainer container;
    late MockSignOutUseCase mockSignOutUseCase;

    setUp(() {
      mockSignOutUseCase = MockSignOutUseCase();

      container = ProviderContainer(
        overrides: [
          signOutUseCaseProvider.overrideWith(MockSignOutUseCaseProvider.new),
        ],
      );

      container.read(signOutUseCaseProvider.notifier).state =
          mockSignOutUseCase;
    });

    tearDown(() {
      container.dispose();
    });

    test('should return false initially', () async {
      // Act
      final future = container.read(signOutStateProvider.future);

      // Assert
      expect(await future, false);
    });

    test('should set loading state when signing out', () {
      // Arrange
      when(mockSignOutUseCase()).thenAnswer((_) async {
        await Future.delayed(const Duration(milliseconds: 100));
      });

      // Act
      container.read(signOutStateProvider.notifier).signOut();
      final asyncValue = container.read(signOutStateProvider);

      // Assert
      expect(asyncValue.isLoading, true);
    });

    test('should successfully sign out and return true', () async {
      // Arrange
      when(mockSignOutUseCase()).thenAnswer((_) async {});

      // Act
      await container.read(signOutStateProvider.notifier).signOut();
      final result = await container.read(signOutStateProvider.future);

      // Assert
      verify(mockSignOutUseCase()).called(1);
      expect(result, true);
    });

    test('should handle sign out failure', () async {
      // Arrange
      final exception = Exception('Sign out failed');
      when(mockSignOutUseCase()).thenThrow(exception);

      // Act & Assert
      expect(
        () => container.read(signOutStateProvider.notifier).signOut(),
        throwsA(isA<Exception>()),
      );
    });

    test('should maintain state after successful sign out', () async {
      // Arrange
      when(mockSignOutUseCase()).thenAnswer((_) async {});

      // Act
      await container.read(signOutStateProvider.notifier).signOut();

      // Assert
      expect(container.read(signOutStateProvider).value, true);
      expect(container.read(signOutStateProvider).hasValue, true);
      expect(container.read(signOutStateProvider).isLoading, false);
    });

    test('should reset state when provider is refreshed', () async {
      // Arrange
      when(mockSignOutUseCase()).thenAnswer((_) async {});
      await container.read(signOutStateProvider.notifier).signOut();

      // Act
      container.refresh(signOutStateProvider);
      final result = await container.read(signOutStateProvider.future);

      // Assert
      expect(result, false);
    });

    test(
      'should call use case multiple times for multiple sign outs',
      () async {
        // Arrange
        when(mockSignOutUseCase()).thenAnswer((_) async {});

        // Act
        await container.read(signOutStateProvider.notifier).signOut();
        container.refresh(signOutStateProvider);
        await container.read(signOutStateProvider.notifier).signOut();

        // Assert
        verify(mockSignOutUseCase()).called(2);
      },
    );
  });
}
