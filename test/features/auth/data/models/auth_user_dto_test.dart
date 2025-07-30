import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/data/models/auth_user/auth_user_dto.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helpers.dart';
@GenerateNiceMocks([MockSpec<User>()])
import 'auth_user_dto_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('AuthUserDto', () {
    const testAuthUserDto = AuthUserDto(
      id: 'test_id',
      email: 'test@example.com',
      name: 'Test User',
      photoUrl: 'https://example.com/photo.jpg',
    );

    const testJson = {
      'id': 'test_id',
      'email': 'test@example.com',
      'name': 'Test User',
      'photoUrl': 'https://example.com/photo.jpg',
    };

    group('fromJson', () {
      test('should create AuthUserDto from valid JSON', () {
        // Act
        final result = AuthUserDto.fromJson(testJson);

        // Assert
        expect(result.id, 'test_id');
        expect(result.email, 'test@example.com');
        expect(result.name, 'Test User');
        expect(result.photoUrl, 'https://example.com/photo.jpg');
      });

      test('should create AuthUserDto from JSON without photoUrl', () {
        // Arrange
        final jsonWithoutPhotoUrl = Map<String, dynamic>.from(testJson)
          ..remove('photoUrl');

        // Act
        final result = AuthUserDto.fromJson(jsonWithoutPhotoUrl);

        // Assert
        expect(result.id, 'test_id');
        expect(result.email, 'test@example.com');
        expect(result.name, 'Test User');
        expect(result.photoUrl, null);
      });

      test('should throw when required fields are missing', () {
        // Arrange
        const incompleteJson = {
          'id': 'test_id',
          // Missing email and name
        };

        // Act & Assert
        expect(
          () => AuthUserDto.fromJson(incompleteJson),
          throwsA(isA<TypeError>()),
        );
      });
    });

    group('toJson', () {
      test('should convert AuthUserDto to JSON with all fields', () {
        // Act
        final result = testAuthUserDto.toJson();

        // Assert
        expect(result, testJson);
      });

      test('should convert AuthUserDto to JSON without photoUrl when null', () {
        // Arrange
        const dtoWithoutPhoto = AuthUserDto(
          id: 'test_id',
          email: 'test@example.com',
          name: 'Test User',
        );

        // Act
        final result = dtoWithoutPhoto.toJson();

        // Assert
        expect(result.containsKey('photoUrl'), false);
        expect(result['id'], 'test_id');
        expect(result['email'], 'test@example.com');
        expect(result['name'], 'Test User');
      });
    });

    group('fromFirebaseUser', () {
      late MockUser mockUser;

      setUp(() {
        mockUser = MockUser();
      });

      test('should create AuthUserDto from Firebase User with all fields', () {
        // Arrange
        when(mockUser.uid).thenReturn('firebase_uid');
        when(mockUser.email).thenReturn('firebase@example.com');
        when(mockUser.displayName).thenReturn('Firebase User');
        when(mockUser.photoURL).thenReturn('https://firebase.com/photo.jpg');

        // Act
        final result = AuthUserDto.fromFirebaseUser(mockUser);

        // Assert
        expect(result.id, 'firebase_uid');
        expect(result.email, 'firebase@example.com');
        expect(result.name, 'Firebase User');
        expect(result.photoUrl, 'https://firebase.com/photo.jpg');
      });

      test('should handle null email and displayName from Firebase User', () {
        // Arrange
        when(mockUser.uid).thenReturn('firebase_uid');
        when(mockUser.email).thenReturn(null);
        when(mockUser.displayName).thenReturn(null);
        when(mockUser.photoURL).thenReturn(null);

        // Act
        final result = AuthUserDto.fromFirebaseUser(mockUser);

        // Assert
        expect(result.id, 'firebase_uid');
        expect(result.email, '');
        expect(result.name, '');
        expect(result.photoUrl, null);
      });
    });

    group('toDomain', () {
      test('should convert AuthUserDto to AuthUser domain entity', () {
        // Act
        final result = testAuthUserDto.toDomain();

        // Assert
        expect(result, isA<AuthUser>());
        expect(result.id, testAuthUserDto.id);
        expect(result.email, testAuthUserDto.email);
        expect(result.name, testAuthUserDto.name);
        expect(result.photoUrl, testAuthUserDto.photoUrl);
      });

      test('should convert AuthUserDto with null photoUrl to AuthUser', () {
        // Arrange
        const dtoWithoutPhoto = AuthUserDto(
          id: 'test_id',
          email: 'test@example.com',
          name: 'Test User',
        );

        // Act
        final result = dtoWithoutPhoto.toDomain();

        // Assert
        expect(result, isA<AuthUser>());
        expect(result.photoUrl, null);
      });
    });

    group('equality and hashCode', () {
      test('should be equal when all properties are the same', () {
        // Arrange
        const dto1 = AuthUserDto(
          id: 'test_id',
          email: 'test@example.com',
          name: 'Test User',
          photoUrl: 'https://example.com/photo.jpg',
        );
        const dto2 = AuthUserDto(
          id: 'test_id',
          email: 'test@example.com',
          name: 'Test User',
          photoUrl: 'https://example.com/photo.jpg',
        );

        // Assert
        expect(dto1, equals(dto2));
        expect(dto1.hashCode, equals(dto2.hashCode));
      });

      test('should not be equal when properties differ', () {
        // Arrange
        const dto1 = AuthUserDto(
          id: 'test_id',
          email: 'test@example.com',
          name: 'Test User',
        );
        const dto2 = AuthUserDto(
          id: 'different_id',
          email: 'test@example.com',
          name: 'Test User',
        );

        // Assert
        expect(dto1, isNot(equals(dto2)));
      });
    });

    group('copyWith', () {
      test('should create copy with updated fields', () {
        // Act
        final result = testAuthUserDto.copyWith(
          name: 'Updated User',
          email: 'updated@example.com',
        );

        // Assert
        expect(result.id, testAuthUserDto.id);
        expect(result.email, 'updated@example.com');
        expect(result.name, 'Updated User');
        expect(result.photoUrl, testAuthUserDto.photoUrl);
      });

      test('should create identical copy when no fields updated', () {
        // Act
        final result = testAuthUserDto.copyWith();

        // Assert
        expect(result, equals(testAuthUserDto));
      });
    });
  });
}
