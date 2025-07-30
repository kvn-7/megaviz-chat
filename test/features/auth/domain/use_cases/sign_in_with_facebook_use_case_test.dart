import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/sign_in_with_facebook_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helpers.dart';
@GenerateNiceMocks([MockSpec<IAuthRepository>()])
import 'sign_in_with_facebook_use_case_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('SignInWithFacebookUseCase', () {
    late SignInWithFacebookUseCase useCase;
    late MockIAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockIAuthRepository();
      useCase = SignInWithFacebookUseCase(mockRepository);
    });

    const testUser = AuthUser(
      id: 'test_id',
      email: 'test@example.com',
      name: 'Test User',
      photoUrl: 'https://example.com/photo.jpg',
    );

    test('should call repository signInWithFacebook with fcm token', () async {
      // Arrange
      when(
        mockRepository.signInWithFacebook(),
      ).thenAnswer((_) async => const Right(testUser));

      // Act
      await useCase();

      // Assert
      verify(mockRepository.signInWithFacebook()).called(1);
    });

    test('should return AuthUser when sign in is successful', () async {
      // Arrange
      when(
        mockRepository.signInWithFacebook(),
      ).thenAnswer((_) async => const Right(testUser));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isRight(), true);
      expect(result.getRight(), equals(testUser));
    });

    test('should return AppException when sign in fails', () async {
      // Arrange
      final exception = AppException(
        message: 'Facebook sign in failed',
        statusCode: 401,
        identifier: 'facebook_sign_in_failed',
      );
      when(
        mockRepository.signInWithFacebook(),
      ).thenAnswer((_) async => Left(exception));

      // Act
      final result = await useCase();

      // Assert
      expect(result.isLeft(), true);
      expect(result.getLeft(), equals(exception));
    });
  });
}
