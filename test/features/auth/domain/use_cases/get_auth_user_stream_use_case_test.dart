import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/get_auth_user_stream_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helpers.dart';
@GenerateNiceMocks([MockSpec<IAuthRepository>()])
import 'get_auth_user_stream_use_case_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('GetAuthUserStreamUseCase', () {
    late GetAuthUserStreamUseCase useCase;
    late MockIAuthRepository mockRepository;

    setUp(() {
      mockRepository = MockIAuthRepository();
      useCase = GetAuthUserStreamUseCase(mockRepository);
    });

    const testUser = AuthUser(
      id: 'test_id',
      email: 'test@example.com',
      name: 'Test User',
      photoUrl: 'https://example.com/photo.jpg',
    );

    test('should call repository getAuthUserStream method', () {
      // Arrange
      when(
        mockRepository.getAuthUserStream(),
      ).thenAnswer((_) => Stream.value(testUser));

      // Act
      useCase();

      // Assert
      verify(mockRepository.getAuthUserStream()).called(1);
    });

    test(
      'should return stream of AuthUser when user is authenticated',
      () async {
        // Arrange
        when(
          mockRepository.getAuthUserStream(),
        ).thenAnswer((_) => Stream.value(testUser));

        // Act
        final stream = useCase();

        // Assert
        expect(stream, emits(testUser));
      },
    );

    test(
      'should return stream of null when user is not authenticated',
      () async {
        // Arrange
        when(
          mockRepository.getAuthUserStream(),
        ).thenAnswer((_) => Stream.value(null));

        // Act
        final stream = useCase();

        // Assert
        expect(stream, emits(null));
      },
    );

    test('should emit multiple auth state changes', () async {
      // Arrange
      const updatedUser = AuthUser(
        id: 'test_id',
        email: 'test@example.com',
        name: 'Updated User',
        photoUrl: 'https://example.com/new_photo.jpg',
      );

      when(
        mockRepository.getAuthUserStream(),
      ).thenAnswer((_) => Stream.fromIterable([testUser, updatedUser, null]));

      // Act
      final stream = useCase();

      // Assert
      expect(stream, emitsInOrder([testUser, updatedUser, null]));
    });

    test('should propagate stream errors', () async {
      // Arrange
      final exception = Exception('Stream error');
      when(
        mockRepository.getAuthUserStream(),
      ).thenAnswer((_) => Stream.error(exception));

      // Act
      final stream = useCase();

      // Assert
      expect(stream, emitsError(exception));
    });
  });
}
