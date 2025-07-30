import 'package:flutter_test/flutter_test.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';

void main() {
  group('AuthUser Entity Tests', () {
    test('should create AuthUser with all required fields', () {
      // Arrange
      const id = 'test_id';
      const email = 'test@example.com';
      const name = 'Test User';
      const photoUrl = 'https://example.com/photo.jpg';

      // Act
      const authUser = AuthUser(
        id: id,
        email: email,
        name: name,
        photoUrl: photoUrl,
      );

      // Assert
      expect(authUser.id, equals(id));
      expect(authUser.email, equals(email));
      expect(authUser.name, equals(name));
      expect(authUser.photoUrl, equals(photoUrl));
    });

    test('should create AuthUser with null photoUrl', () {
      // Arrange & Act
      const authUser = AuthUser(
        id: 'test_id',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: null,
      );

      // Assert
      expect(authUser.photoUrl, isNull);
    });

    test('should support equality comparison', () {
      // Arrange
      const authUser1 = AuthUser(
        id: 'test_id',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'photo.jpg',
      );

      const authUser2 = AuthUser(
        id: 'test_id',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'photo.jpg',
      );

      // Act & Assert
      expect(authUser1, equals(authUser2));
      expect(authUser1.hashCode, equals(authUser2.hashCode));
    });

    test('should support copyWith method', () {
      // Arrange
      const originalUser = AuthUser(
        id: 'test_id',
        email: 'test@example.com',
        name: 'Test User',
        photoUrl: 'photo.jpg',
      );

      // Act
      final updatedUser = originalUser.copyWith(name: 'Updated User');

      // Assert
      expect(updatedUser.name, equals('Updated User'));
      expect(updatedUser.id, equals(originalUser.id));
      expect(updatedUser.email, equals(originalUser.email));
      expect(updatedUser.photoUrl, equals(originalUser.photoUrl));
    });
  });
}
