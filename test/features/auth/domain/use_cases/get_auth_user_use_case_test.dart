import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/get_auth_user_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helpers.dart';
@GenerateNiceMocks([MockSpec<IAuthRepository>()])
import 'get_auth_user_use_case_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('GetAuthUserUseCase', () {
    late GetAuthUserUseCase useCase;
    late MockIAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockIAuthRepository();
      useCase = GetAuthUserUseCase(mockRepository);
    });

    const testUser = AuthUser(
      id: 'test_id',
      email: 'test@example.com',
      name: 'Test User',
      photoUrl: 'https://example.com/photo.jpg',
    );

    test('should call repository getAuthUser method', () async {
      // Arrange
      when(mockRepository.getAuthUser()).thenAnswer((_) async => testUser);

      // Act
      await useCase();

      // Assert
      verify(mockRepository.getAuthUser()).called(1);
    });

    test('should return AuthUser when user is authenticated', () async {
      // Arrange
      when(mockRepository.getAuthUser()).thenAnswer((_) async => testUser);

      // Act
      final result = await useCase();

      // Assert
      expect(result, equals(testUser));
    });

    test('should return null when user is not authenticated', () async {
      // Arrange
      when(mockRepository.getAuthUser()).thenAnswer((_) async => null);

      // Act
      final result = await useCase();

      // Assert
      expect(result, isNull);
    });

    test('should propagate exception when repository throws', () async {
      // Arrange
      final exception = Exception('Get auth user failed');
      when(mockRepository.getAuthUser()).thenThrow(exception);

      // Act & Assert
      expect(() => useCase(), throwsA(exception));
    });
  });
}
