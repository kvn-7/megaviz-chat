import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/set_online_offline_status_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helpers.dart';
@GenerateNiceMocks([MockSpec<IAuthRepository>()])
import 'set_online_offline_status_use_case_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('SetOnlineOfflineStatusUseCase', () {
    late SetOnlineOfflineStatusUseCase useCase;
    late MockIAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockIAuthRepository();
      useCase = SetOnlineOfflineStatusUseCase(mockRepository);
    });

    test('should call repository setOnlineOffline with true status', () async {
      // Arrange
      when(mockRepository.setOnlineOffline(true)).thenAnswer((_) async {});

      // Act
      await useCase(true);

      // Assert
      verify(mockRepository.setOnlineOffline(true)).called(1);
    });

    test('should call repository setOnlineOffline with false status', () async {
      // Arrange
      when(mockRepository.setOnlineOffline(false)).thenAnswer((_) async {});

      // Act
      await useCase(false);

      // Assert
      verify(mockRepository.setOnlineOffline(false)).called(1);
    });

    test(
      'should complete successfully when repository call succeeds',
      () async {
        // Arrange
        when(mockRepository.setOnlineOffline(any)).thenAnswer((_) async {});

        // Act & Assert
        // expect(() => useCase(true), returnsNormally);
        await useCase(true);
        verify(mockRepository.setOnlineOffline(true)).called(1);
      },
    );

    test('should propagate exception when repository throws', () async {
      // Arrange
      final exception = Exception('Set status failed');
      when(mockRepository.setOnlineOffline(any)).thenThrow(exception);

      // Act & Assert
      expect(() => useCase(true), throwsA(exception));
    });

    test('should handle multiple status changes', () async {
      // Arrange
      when(mockRepository.setOnlineOffline(any)).thenAnswer((_) async {});

      // Act
      await useCase(true);
      await useCase(false);
      await useCase(true);

      // Assert
      verifyInOrder([
        mockRepository.setOnlineOffline(true),
        mockRepository.setOnlineOffline(false),
        mockRepository.setOnlineOffline(true),
      ]);
    });
  });
}
