import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/data/models/auth_user/auth_user_dto.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthDatasource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  final FacebookAuth _facebookAuth;
  final FirebaseMessaging _firebaseMessaging;

  FirebaseAuthDatasource({
    FirebaseAuth? auth,
    GoogleSignIn? googleSignIn,
    FirebaseFirestore? firestore,
    FacebookAuth? facebookAuth,
    FirebaseMessaging? firebaseMessaging,
  }) : _auth = auth ?? FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn(scopes: ['email']),
       _firestore = firestore ?? FirebaseFirestore.instance,
       _facebookAuth = facebookAuth ?? FacebookAuth.instance,
       _firebaseMessaging = firebaseMessaging ?? FirebaseMessaging.instance;

  Future<Either<AppException, AuthUserDto>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return _createAuthException(
          'Google sign-in was cancelled by user',
          'google_sign_in_cancelled',
        );
      }

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final fcmToken = await getFcmToken();

      return await _signInWithCredential(credential, fcmToken);
    } on FirebaseAuthException catch (e) {
      await _googleSignIn.signOut();
      return _handleFirebaseAuthException(e);
    } on PlatformException catch (e) {
      await _googleSignIn.signOut();
      return _handleGooglePlatformException(e);
    } catch (e) {
      await _googleSignIn.signOut();
      return _createAuthException(
        'An unexpected error occurred during sign-in: ${e.toString()}',
        'unexpected_error',
        statusCode: 500,
      );
    }
  }

  Future<Either<AppException, AuthUserDto>> signInWithFacebook() async {
    try {
      final LoginResult result = await _facebookAuth.login();

      if (result.status != LoginStatus.success) {
        return _handleFacebookLoginResult(result);
      }

      final AccessToken accessToken = result.accessToken!;
      final OAuthCredential credential = FacebookAuthProvider.credential(
        accessToken.tokenString,
      );

      final fcmToken = await getFcmToken();

      return await _signInWithCredential(credential, fcmToken);
    } on FirebaseAuthException catch (e) {
      await _facebookAuth.logOut();
      return _handleFirebaseAuthException(e);
    } on PlatformException catch (e) {
      await _facebookAuth.logOut();
      return _handleFacebookPlatformException(e);
    } catch (e) {
      await _facebookAuth.logOut();
      return _createAuthException(
        'An unexpected error occurred during Facebook sign-in: ${e.toString()}',
        'unexpected_error',
        statusCode: 500,
      );
    }
  }

  Future<void> signOut() async {
    await setOnlineOffline(false);
    await updateFcmToken(null);
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
      _facebookAuth.logOut(),
    ]);
  }

  AuthUserDto? get currentUser {
    final user = _auth.currentUser;
    return user != null ? AuthUserDto.fromFirebaseUser(user) : null;
  }

  Stream<AuthUserDto?> get userChanges {
    return _auth.authStateChanges().map((user) {
      return user != null ? AuthUserDto.fromFirebaseUser(user) : null;
    });
  }

  Future<Either<AppException, void>> createUserInFirestore(
    String? fcmToken,
  ) async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return _createAuthException(
          'No authenticated user found',
          'no_authenticated_user',
        );
      }

      final userDoc = _firestore.collection('users').doc(user.uid);
      await userDoc.set({
        'uid': user.uid,
        'email': user.email,
        'displayName': user.displayName,
        'photoURL': user.photoURL,
        'fcmToken': fcmToken,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return const Right(null);
    } catch (e) {
      return _createAuthException(
        'Failed to create user in Firestore: ${e.toString()}',
        'create_user_firestore_error',
        statusCode: 500,
      );
    }
  }

  Future<void> setOnlineOffline(bool isOnline) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final userDoc = _firestore.collection('users').doc(user.uid);
      await userDoc.update({
        'isOnline': isOnline,
        'lastSeen': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      log(
        'Failed to update online status: ${e.toString()}',
        name: 'FirebaseAuthDatasource.setOnlineOffline',
      );
    }
  }

  Future<void> updateFcmToken(String? fcmToken) async {
    try {
      final user = _auth.currentUser;
      if (user == null) return;

      final userDoc = _firestore.collection('users').doc(user.uid);
      await userDoc.update({'fcmToken': fcmToken});
    } catch (e) {
      log(
        'Failed to update FCM token: ${e.toString()}',
        name: 'FirebaseAuthDatasource.updateFcmToken',
      );
    }
  }

  // Private helper methods to reduce duplication

  Future<Either<AppException, AuthUserDto>> _signInWithCredential(
    AuthCredential credential,
    String? fcmToken,
  ) async {
    final userCredential = await _auth.signInWithCredential(credential);
    final user = userCredential.user;

    if (user == null) {
      return _createAuthException(
        'Firebase authentication failed',
        'firebase_auth_failed',
      );
    }

    await createUserInFirestore(fcmToken);
    return Right(AuthUserDto.fromFirebaseUser(user));
  }

  Left<AppException, T> _createAuthException<T>(
    String message,
    String identifier, {
    int statusCode = 401,
  }) {
    return Left(
      AppException(
        message: message,
        statusCode: statusCode,
        identifier: identifier,
      ),
    );
  }

  Left<AppException, AuthUserDto> _handleFirebaseAuthException(
    FirebaseAuthException e,
  ) {
    final errorMap = {
      'account-exists-with-different-credential': (
        'An account already exists with a different sign-in method',
        'account_exists_different_credential',
      ),
      'invalid-credential': (
        'The credential is invalid or expired',
        'invalid_credential',
      ),
      'operation-not-allowed': (
        'Sign-in method is not enabled',
        'operation_not_allowed',
      ),
      'user-disabled': ('This user account has been disabled', 'user_disabled'),
      'user-not-found': (
        'No user found with this credential',
        'user_not_found',
      ),
      'wrong-password': ('Invalid password', 'wrong_password'),
      'too-many-requests': (
        'Too many failed attempts. Please try again later',
        'too_many_requests',
      ),
      'network-request-failed': (
        'Network error. Please check your connection',
        'network_error',
      ),
    };

    final errorInfo =
        errorMap[e.code] ??
        ('Firebase authentication failed: ${e.message}', 'firebase_auth_error');
    return _createAuthException(errorInfo.$1, errorInfo.$2);
  }

  Left<AppException, AuthUserDto> _handleGooglePlatformException(
    PlatformException e,
  ) {
    final errorMap = {
      'sign_in_failed': (
        'Google sign-in failed. Please try again',
        'google_sign_in_failed',
      ),
      'network_error': (
        'Network error during Google sign-in',
        'google_network_error',
      ),
      'sign_in_cancelled': (
        'Google sign-in was cancelled',
        'google_sign_in_cancelled',
      ),
    };

    final errorInfo =
        errorMap[e.code] ??
        ('Google sign-in error: ${e.message}', 'google_platform_error');
    return _createAuthException(errorInfo.$1, errorInfo.$2);
  }

  Left<AppException, AuthUserDto> _handleFacebookPlatformException(
    PlatformException e,
  ) {
    final errorMap = {
      'CANCELLED': (
        'Facebook sign-in was cancelled',
        'facebook_sign_in_cancelled',
      ),
      'FAILED': (
        'Facebook sign-in failed. Please try again',
        'facebook_sign_in_failed',
      ),
    };

    final errorInfo =
        errorMap[e.code] ??
        ('Facebook sign-in error: ${e.message}', 'facebook_platform_error');
    return _createAuthException(errorInfo.$1, errorInfo.$2);
  }

  Left<AppException, AuthUserDto> _handleFacebookLoginResult(
    LoginResult result,
  ) {
    final statusMap = {
      LoginStatus.cancelled: (
        'Facebook sign-in was cancelled by user',
        'facebook_sign_in_cancelled',
      ),
      LoginStatus.failed: (
        'Facebook sign-in failed: ${result.message}',
        'facebook_sign_in_failed',
      ),
      LoginStatus.operationInProgress: (
        'Facebook sign-in operation is already in progress',
        'facebook_operation_in_progress',
      ),
    };

    final errorInfo =
        statusMap[result.status] ??
        (
          'Facebook sign-in failed with unknown status',
          'facebook_unknown_error',
        );
    return _createAuthException(errorInfo.$1, errorInfo.$2);
  }

  Future<String?> getFcmToken() async {
    try {
      final token = await _firebaseMessaging.getToken();
      return token;
    } catch (e) {
      log('Error getting FCM token: $e');
      return null;
    }
  }
}
