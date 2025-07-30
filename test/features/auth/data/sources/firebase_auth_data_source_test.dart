import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/data/models/auth_user/auth_user_dto.dart';
import 'package:megaviz_chat/src/features/auth/data/sources/firebase_auth_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helpers.dart';

@GenerateNiceMocks([
  MockSpec<FirebaseAuth>(),
  MockSpec<GoogleSignIn>(),
  MockSpec<FirebaseFirestore>(),
  MockSpec<FacebookAuth>(),
  MockSpec<FirebaseMessaging>(),
  MockSpec<User>(),
  MockSpec<UserCredential>(),
  MockSpec<GoogleSignInAccount>(),
  MockSpec<GoogleSignInAuthentication>(),
  MockSpec<DocumentReference<Map<String, dynamic>>>(),
  MockSpec<CollectionReference<Map<String, dynamic>>>(),
  MockSpec<AccessToken>(),
  MockSpec<LoginResult>(),
])
import 'firebase_auth_data_source_test.mocks.dart';

void main() {
  provideMockitoDummies();

  group('FirebaseAuthDatasource', () {
    late FirebaseAuthDatasource dataSource;
    late MockFirebaseAuth mockFirebaseAuth;
    late MockGoogleSignIn mockGoogleSignIn;
    late MockFirebaseFirestore mockFirestore;
    late MockFacebookAuth mockFacebookAuth;
    late MockUser mockUser;
    late MockUserCredential mockUserCredential;
    late MockDocumentReference mockDocumentReference;
    late MockCollectionReference mockCollectionReference;
    late MockFirebaseMessaging mockFirebaseMessaging;

    setUp(() {
      mockFirebaseAuth = MockFirebaseAuth();
      mockGoogleSignIn = MockGoogleSignIn();
      mockFirestore = MockFirebaseFirestore();
      mockFacebookAuth = MockFacebookAuth();
      mockUser = MockUser();
      mockUserCredential = MockUserCredential();
      mockDocumentReference = MockDocumentReference();
      mockCollectionReference = MockCollectionReference();
      mockFirebaseMessaging = MockFirebaseMessaging();

      // Setup common mocks
      when(
        mockFirestore.collection('users'),
      ).thenReturn(mockCollectionReference);
      when(mockCollectionReference.doc(any)).thenReturn(mockDocumentReference);
      when(mockDocumentReference.set(any)).thenAnswer((_) async {});
      when(mockDocumentReference.update(any)).thenAnswer((_) async {});
      when(
        mockFirebaseMessaging.getToken(),
      ).thenAnswer((_) async => 'test_fcm_token');

      dataSource = FirebaseAuthDatasource(
        auth: mockFirebaseAuth,
        googleSignIn: mockGoogleSignIn,
        firestore: mockFirestore,
        facebookAuth: mockFacebookAuth,
        firebaseMessaging: mockFirebaseMessaging,
      );
      // Note: In a real test, you'd need to inject these dependencies
      // For now, this shows the test structure
    });

    group('signInWithGoogle', () {
      late MockGoogleSignInAccount mockGoogleSignInAccount;
      late MockGoogleSignInAuthentication mockGoogleAuth;

      setUp(() {
        mockGoogleSignInAccount = MockGoogleSignInAccount();
        mockGoogleAuth = MockGoogleSignInAuthentication();
      });

      test('should return AuthUserDto on successful Google sign-in', () async {
        when(
          mockGoogleSignIn.signIn(),
        ).thenAnswer((_) async => mockGoogleSignInAccount);
        when(
          mockGoogleSignInAccount.authentication,
        ).thenAnswer((_) async => mockGoogleAuth);
        when(mockGoogleAuth.idToken).thenReturn('id_token');
        when(mockGoogleAuth.accessToken).thenReturn('access_token');
        when(
          mockFirebaseAuth.signInWithCredential(any),
        ).thenAnswer((_) async => mockUserCredential);
        when(mockUserCredential.user).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user_id');
        when(mockUser.email).thenReturn('test@example.com');
        when(mockUser.displayName).thenReturn('Test User');
        when(mockUser.photoURL).thenReturn('photo_url');
        when(
          mockFirebaseMessaging.getToken(),
        ).thenAnswer((_) async => 'fcm_token');

        // Act
        final result = await dataSource.signInWithGoogle();

        // Assert
        expect(result, isA<Right<AppException, AuthUserDto>>());
        final authUser = result.getRight();
        expect(authUser.id, 'user_id');
        expect(authUser.email, 'test@example.com');
      });

      test(
        'should return AppException when Google sign-in is cancelled',
        () async {
          // Arrange
          when(mockGoogleSignIn.signIn()).thenAnswer((_) async => null);

          // Act
          final result = await dataSource.signInWithGoogle();

          // Assert
          expect(result, isA<Left<AppException, AuthUserDto>>());
          final exception = result.getLeft();
          expect(exception.identifier, 'google_sign_in_cancelled');
        },
      );

      test('should handle FirebaseAuthException', () async {
        // Arrange
        when(
          mockGoogleSignIn.signIn(),
        ).thenAnswer((_) async => mockGoogleSignInAccount);
        when(
          mockGoogleSignInAccount.authentication,
        ).thenAnswer((_) async => mockGoogleAuth);
        when(mockGoogleAuth.idToken).thenReturn('id_token');
        when(mockGoogleAuth.accessToken).thenReturn('access_token');
        when(mockFirebaseAuth.signInWithCredential(any)).thenThrow(
          FirebaseAuthException(
            code: 'user-disabled',
            message: 'User disabled',
          ),
        );

        // Act
        final result = await dataSource.signInWithGoogle();

        // Assert
        expect(result, isA<Left<AppException, AuthUserDto>>());
        final exception = result.getLeft();
        expect(exception.identifier, 'user_disabled');
        verify(mockGoogleSignIn.signOut()).called(1);
      });

      test('should handle PlatformException', () async {
        // Arrange
        when(mockGoogleSignIn.signIn()).thenThrow(
          PlatformException(code: 'sign_in_failed', message: 'Sign in failed'),
        );

        // Act
        final result = await dataSource.signInWithGoogle();

        // Assert
        expect(result, isA<Left<AppException, AuthUserDto>>());
        final exception = result.getLeft();
        expect(exception.identifier, 'google_sign_in_failed');
        verify(mockGoogleSignIn.signOut()).called(1);
      });

      test('should handle unexpected exceptions', () async {
        // Arrange
        when(
          mockGoogleSignIn.signIn(),
        ).thenThrow(Exception('Unexpected error'));

        // Act
        final result = await dataSource.signInWithGoogle();

        // Assert
        expect(result, isA<Left<AppException, AuthUserDto>>());
        final exception = result.getLeft();
        expect(exception.identifier, 'unexpected_error');
        expect(exception.statusCode, 500);
        verify(mockGoogleSignIn.signOut()).called(1);
      });
    });

    group('signInWithFacebook', () {
      late MockLoginResult mockLoginResult;
      late MockAccessToken mockAccessToken;

      setUp(() {
        mockLoginResult = MockLoginResult();
        mockAccessToken = MockAccessToken();
      });

      test(
        'should return AuthUserDto on successful Facebook sign-in',
        () async {
          when(
            mockFacebookAuth.login(),
          ).thenAnswer((_) async => mockLoginResult);
          when(mockLoginResult.status).thenReturn(LoginStatus.success);
          when(mockLoginResult.accessToken).thenReturn(mockAccessToken);
          when(mockAccessToken.tokenString).thenReturn('facebook_token');
          when(
            mockFirebaseAuth.signInWithCredential(any),
          ).thenAnswer((_) async => mockUserCredential);
          when(mockUserCredential.user).thenReturn(mockUser);
          when(mockUser.uid).thenReturn('user_id');
          when(mockUser.email).thenReturn('test@example.com');
          when(mockUser.displayName).thenReturn('Test User');

          // Act
          final result = await dataSource.signInWithFacebook();

          // Assert
          expect(result, isA<Right<AppException, AuthUserDto>>());
        },
      );

      test('should handle cancelled Facebook login', () async {
        // Arrange
        when(mockFacebookAuth.login()).thenAnswer((_) async => mockLoginResult);
        when(mockLoginResult.status).thenReturn(LoginStatus.cancelled);

        // Act
        final result = await dataSource.signInWithFacebook();

        // Assert
        expect(result, isA<Left<AppException, AuthUserDto>>());
        final exception = result.getLeft();
        expect(exception.identifier, 'facebook_sign_in_cancelled');
      });

      test('should handle failed Facebook login', () async {
        // Arrange
        when(mockFacebookAuth.login()).thenAnswer((_) async => mockLoginResult);
        when(mockLoginResult.status).thenReturn(LoginStatus.failed);
        when(mockLoginResult.message).thenReturn('Login failed');

        // Act
        final result = await dataSource.signInWithFacebook();

        // Assert
        expect(result, isA<Left<AppException, AuthUserDto>>());
        final exception = result.getLeft();
        expect(exception.identifier, 'facebook_sign_in_failed');
      });

      test('should handle Facebook FirebaseAuthException', () async {
        // Arrange
        when(mockFacebookAuth.login()).thenAnswer((_) async => mockLoginResult);
        when(mockLoginResult.status).thenReturn(LoginStatus.success);
        when(mockLoginResult.accessToken).thenReturn(mockAccessToken);
        when(mockAccessToken.tokenString).thenReturn('facebook_token');
        when(mockFirebaseAuth.signInWithCredential(any)).thenThrow(
          FirebaseAuthException(
            code: 'invalid-credential',
            message: 'Invalid credential',
          ),
        );

        // Act
        final result = await dataSource.signInWithFacebook();

        // Assert
        expect(result, isA<Left<AppException, AuthUserDto>>());
        final exception = result.getLeft();
        expect(exception.identifier, 'invalid_credential');
        verify(mockFacebookAuth.logOut()).called(1);
      });
    });

    group('signOut', () {
      test('should call all sign out methods', () async {
        // Arrange
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user_id');
        when(mockFirebaseAuth.signOut()).thenAnswer((_) async {});
        when(mockGoogleSignIn.signOut()).thenAnswer((_) async => null);
        when(mockFacebookAuth.logOut()).thenAnswer((_) async {});

        // Act
        await dataSource.signOut();

        // Assert
        verify(mockFirebaseAuth.signOut()).called(1);
        verify(mockGoogleSignIn.signOut()).called(1);
        verify(mockFacebookAuth.logOut()).called(1);
      });
    });

    group('currentUser', () {
      test('should return AuthUserDto when user is signed in', () {
        // Arrange
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user_id');
        when(mockUser.email).thenReturn('test@example.com');
        when(mockUser.displayName).thenReturn('Test User');

        // Act
        final result = dataSource.currentUser;

        // Assert
        expect(result, isA<AuthUserDto>());
        expect(result?.id, 'user_id');
      });

      test('should return null when no user is signed in', () {
        // Arrange
        when(mockFirebaseAuth.currentUser).thenReturn(null);

        // Act
        final result = dataSource.currentUser;

        // Assert
        expect(result, null);
      });
    });

    group('userChanges', () {
      test('should emit AuthUserDto when user signs in', () {
        // Arrange
        when(
          mockFirebaseAuth.authStateChanges(),
        ).thenAnswer((_) => Stream.value(mockUser));
        when(mockUser.uid).thenReturn('user_id');
        when(mockUser.email).thenReturn('test@example.com');
        when(mockUser.displayName).thenReturn('Test User');

        // Act
        final stream = dataSource.userChanges;

        // Assert
        expect(stream, emits(isA<AuthUserDto>()));
      });

      test('should emit null when user signs out', () {
        // Arrange
        when(
          mockFirebaseAuth.authStateChanges(),
        ).thenAnswer((_) => Stream.value(null));

        // Act
        final stream = dataSource.userChanges;

        // Assert
        expect(stream, emits(null));
      });
    });

    group('createUserInFirestore', () {
      test('should create user document successfully', () async {
        // Arrange
        const fcmToken = 'test_fcm_token';
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user_id');
        when(mockUser.email).thenReturn('test@example.com');
        when(mockUser.displayName).thenReturn('Test User');
        when(mockUser.photoURL).thenReturn('photo_url');

        // Act
        final result = await dataSource.createUserInFirestore(fcmToken);

        // Assert
        expect(result, isA<Right<AppException, void>>());
        verify(mockDocumentReference.set(any)).called(1);
      });

      test('should return error when no authenticated user', () async {
        // Arrange
        when(mockFirebaseAuth.currentUser).thenReturn(null);

        // Act
        final result = await dataSource.createUserInFirestore('token');

        // Assert
        expect(result, isA<Left<AppException, void>>());
        final exception = result.getLeft();
        expect(exception.identifier, 'no_authenticated_user');
      });

      test('should handle Firestore errors', () async {
        // Arrange
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user_id');
        when(
          mockDocumentReference.set(any),
        ).thenThrow(Exception('Firestore error'));

        // Act
        final result = await dataSource.createUserInFirestore('token');

        // Assert
        expect(result, isA<Left<AppException, void>>());
        final exception = result.getLeft();
        expect(exception.identifier, 'create_user_firestore_error');
      });
    });

    group('setOnlineOffline', () {
      test('should update online status successfully', () async {
        // Arrange
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user_id');

        // Act
        await dataSource.setOnlineOffline(true);

        // Assert
        verify(mockDocumentReference.update(any)).called(1);
      });

      test('should handle when no user is authenticated', () async {
        // Arrange
        when(mockFirebaseAuth.currentUser).thenReturn(null);

        // Act & Assert - Should not throw
        await dataSource.setOnlineOffline(true);
        verifyNever(mockDocumentReference.update(any));
      });
    });

    group('updateFcmToken', () {
      test('should update FCM token successfully', () async {
        // Arrange
        const fcmToken = 'new_fcm_token';
        when(mockFirebaseAuth.currentUser).thenReturn(mockUser);
        when(mockUser.uid).thenReturn('user_id');

        // Act
        await dataSource.updateFcmToken(fcmToken);

        // Assert
        verify(mockDocumentReference.update({'fcmToken': fcmToken})).called(1);
      });

      test('should handle when no user is authenticated', () async {
        // Arrange
        when(mockFirebaseAuth.currentUser).thenReturn(null);

        // Act & Assert - Should not throw
        await dataSource.updateFcmToken('token');
        verifyNever(mockDocumentReference.update(any));
      });
    });
  });
}
