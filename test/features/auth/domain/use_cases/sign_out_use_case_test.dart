import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helpers.dart';
@GenerateNiceMocks([MockSpec<IAuthRepository>()])
import 'sign_out_use_case_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('SignOutUseCase', () {
    late SignOutUseCase useCase;
    late MockIAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockIAuthRepository();
      useCase = SignOutUseCase(mockRepository);
    });

    test('should call repository signOut method', () async {
      // Arrange
      when(mockRepository.signOut()).thenAnswer((_) async {});

      // Act
      await useCase();

      // Assert
      verify(mockRepository.signOut()).called(1);
    });

    test(
      'should complete successfully when repository signOut succeeds',
      () async {
        // Arrange
        when(mockRepository.signOut()).thenAnswer((_) async {});

        // Act & Assert
        // expect(() => useCase(), returnsNormally);
        await useCase();
        verify(mockRepository.signOut()).called(1);
      },
    );

    test('should propagate exception when repository throws', () async {
      // Arrange
      final exception = Exception('Sign out failed');
      when(mockRepository.signOut()).thenThrow(exception);

      // Act & Assert
      expect(() => useCase(), throwsA(exception));
    });
  });
}
