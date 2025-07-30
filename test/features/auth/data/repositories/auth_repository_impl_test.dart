import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/data/models/auth_user/auth_user_dto.dart';
import 'package:megaviz_chat/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:megaviz_chat/src/features/auth/data/sources/firebase_auth_data_source.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helpers.dart';

@GenerateNiceMocks([MockSpec<FirebaseAuthDatasource>()])
import 'auth_repository_impl_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('AuthRepositoryImpl', () {
    late AuthRepositoryImpl repository;
    late MockFirebaseAuthDatasource mockDataSource;

    setUp(() {
      mockDataSource = MockFirebaseAuthDatasource();
      repository = AuthRepositoryImpl(mockDataSource);
    });

    const testAuthUserDto = AuthUserDto(
      id: 'test_id',
      email: 'test@example.com',
      name: 'Test User',
      photoUrl: 'https://example.com/photo.jpg',
    );

    const testAuthUser = AuthUser(
      id: 'test_id',
      email: 'test@example.com',
      name: 'Test User',
      photoUrl: 'https://example.com/photo.jpg',
    );

    final testException = AppException(
      message: 'Test error',
      statusCode: 400,
      identifier: 'test_error',
    );

    group('signInWithGoogle', () {
      test('should return AuthUser on successful sign-in', () async {
        when(
          mockDataSource.signInWithGoogle(),
        ).thenAnswer((_) async => const Right(testAuthUserDto));

        // Act
        final result = await repository.signInWithGoogle();

        // Assert
        expect(result, isA<Right<AppException, AuthUser>>());
        final authUser = result.getRight();
        expect(authUser.id, testAuthUser.id);
        expect(authUser.email, testAuthUser.email);
        expect(authUser.name, testAuthUser.name);
        expect(authUser.photoUrl, testAuthUser.photoUrl);
        verify(mockDataSource.signInWithGoogle()).called(1);
      });

      test('should return AppException on sign-in failure', () async {
        // Arrange
        const fcmToken = 'test_fcm_token';
        when(
          mockDataSource.signInWithGoogle(),
        ).thenAnswer((_) async => Left(testException));

        // Act
        final result = await repository.signInWithGoogle();

        // Assert
        expect(result, isA<Left<AppException, AuthUser>>());
        final exception = result.getLeft();
        expect(exception.message, testException.message);
        expect(exception.identifier, testException.identifier);
        verify(mockDataSource.signInWithGoogle()).called(1);
      });

      group('signInWithFacebook', () {
        test('should return AuthUser on successful sign-in', () async {
          when(
            mockDataSource.signInWithFacebook(),
          ).thenAnswer((_) async => const Right(testAuthUserDto));

          // Act
          final result = await repository.signInWithFacebook();

          // Assert
          expect(result, isA<Right<AppException, AuthUser>>());
          final authUser = result.getRight();
          expect(authUser.id, testAuthUser.id);
          expect(authUser.email, testAuthUser.email);
          verify(mockDataSource.signInWithFacebook()).called(1);
        });

        test('should return AppException on sign-in failure', () async {
          when(
            mockDataSource.signInWithFacebook(),
          ).thenAnswer((_) async => Left(testException));

          // Act
          final result = await repository.signInWithFacebook();

          // Assert
          expect(result, isA<Left<AppException, AuthUser>>());
          final exception = result.getLeft();
          expect(exception.message, testException.message);
          verify(mockDataSource.signInWithFacebook()).called(1);
        });
      });

      group('getAuthUser', () {
        test('should return AuthUser when user is authenticated', () async {
          // Arrange
          when(mockDataSource.currentUser).thenReturn(testAuthUserDto);

          // Act
          final result = await repository.getAuthUser();

          // Assert
          expect(result, isA<AuthUser>());
          expect(result!.id, testAuthUser.id);
          expect(result.email, testAuthUser.email);
          verify(mockDataSource.currentUser).called(1);
        });

        test('should return null when no user is authenticated', () async {
          // Arrange
          when(mockDataSource.currentUser).thenReturn(null);

          // Act
          final result = await repository.getAuthUser();

          // Assert
          expect(result, null);
          verify(mockDataSource.currentUser).called(1);
        });
      });

      group('getAuthUserStream', () {
        test('should return stream of AuthUser when user is authenticated', () {
          // Arrange
          when(
            mockDataSource.userChanges,
          ).thenAnswer((_) => Stream.value(testAuthUserDto));

          // Act
          final stream = repository.getAuthUserStream();

          // Assert
          expect(stream, emits(isA<AuthUser>()));
          verify(mockDataSource.userChanges).called(1);
        });

        test('should return stream of null when user is not authenticated', () {
          // Arrange
          when(
            mockDataSource.userChanges,
          ).thenAnswer((_) => Stream.value(null));

          // Act
          final stream = repository.getAuthUserStream();

          // Assert
          expect(stream, emits(null));
          verify(mockDataSource.userChanges).called(1);
        });

        test('should emit multiple auth state changes', () {
          // Arrange
          const updatedAuthUserDto = AuthUserDto(
            id: 'test_id',
            email: 'test@example.com',
            name: 'Updated User',
            photoUrl: 'https://example.com/new_photo.jpg',
          );

          when(mockDataSource.userChanges).thenAnswer(
            (_) => Stream.fromIterable([
              testAuthUserDto,
              updatedAuthUserDto,
              null,
            ]),
          );

          // Act
          final stream = repository.getAuthUserStream();

          // Assert
          expect(
            stream,
            emitsInOrder([
              isA<AuthUser>().having((user) => user.name, 'name', 'Test User'),
              isA<AuthUser>().having(
                (user) => user.name,
                'name',
                'Updated User',
              ),
              null,
            ]),
          );
        });

        test('should propagate stream errors', () {
          // Arrange
          final exception = Exception('Stream error');
          when(
            mockDataSource.userChanges,
          ).thenAnswer((_) => Stream.error(exception));

          // Act
          final stream = repository.getAuthUserStream();

          // Assert
          expect(stream, emitsError(exception));
        });
      });

      group('signOut', () {
        test('should call data source signOut method', () async {
          // Arrange
          when(mockDataSource.signOut()).thenAnswer((_) async {});

          // Act
          await repository.signOut();

          // Assert
          verify(mockDataSource.signOut()).called(1);
        });

        test('should propagate exceptions from data source', () async {
          // Arrange
          final exception = Exception('Sign out failed');
          when(mockDataSource.signOut()).thenThrow(exception);

          // Act & Assert
          expect(() => repository.signOut(), throwsA(exception));
        });
      });

      group('setOnlineOffline', () {
        test('should call data source setOnlineOffline with true', () async {
          // Arrange
          when(mockDataSource.setOnlineOffline(true)).thenAnswer((_) async {});

          // Act
          await repository.setOnlineOffline(true);

          // Assert
          verify(mockDataSource.setOnlineOffline(true)).called(1);
        });

        test('should call data source setOnlineOffline with false', () async {
          // Arrange
          when(mockDataSource.setOnlineOffline(false)).thenAnswer((_) async {});

          // Act
          await repository.setOnlineOffline(false);

          // Assert
          verify(mockDataSource.setOnlineOffline(false)).called(1);
        });

        test('should propagate exceptions from data source', () async {
          // Arrange
          final exception = Exception('Update failed');
          when(mockDataSource.setOnlineOffline(any)).thenThrow(exception);

          // Act & Assert
          expect(() => repository.setOnlineOffline(true), throwsA(exception));
        });
      });
    });
  });
}
