import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_in_with_google_use_case.dart';

import '../../../../helpers/test_helpers.dart';
@GenerateNiceMocks([MockSpec<IAuthRepository>()])
import 'sign_in_with_google_use_case_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('SignInWithGoogleUseCase Tests', () {
    late SignInWithGoogleUseCase useCase;
    late MockIAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockIAuthRepository();
      useCase = SignInWithGoogleUseCase(mockRepository);
    });

    test('should return AuthUser when sign in is successful', () async {
      const expectedUser = AuthUser(
        id: 'test_id',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: null,
      );

      when(
        mockRepository.signInWithGoogle(),
      ).thenAnswer((_) async => const Right(expectedUser));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isRight(), isTrue);
      expect(result.getRight(), equals(expectedUser));
      verify(mockRepository.signInWithGoogle()).called(1);
    });

    test('should return AppException when sign in fails', () async {
      // Arrange
      final exception = AppException(
        message: 'Sign in failed',
        statusCode: 401,
        identifier: 'sign_in_failed',
      );

      when(
        mockRepository.signInWithGoogle(),
      ).thenAnswer((_) async => Left(exception));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isLeft(), isTrue);
      expect(result.getLeft(), equals(exception));
      verify(mockRepository.signInWithGoogle()).called(1);
    });

    test('should handle null ', () async {
      // Arrange
      const expectedUser = AuthUser(
        id: 'test_id',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: null,
      );

      when(
        mockRepository.signInWithGoogle(),
      ).thenAnswer((_) async => const Right(expectedUser));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isRight(), isTrue);
      verify(mockRepository.signInWithGoogle()).called(1);
    });
  });
}
