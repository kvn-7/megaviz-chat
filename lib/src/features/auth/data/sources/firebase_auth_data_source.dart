import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/auth/data/models/auth_user/auth_user_dto.dart';

class FirebaseAuthDatasource {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  FirebaseAuthDatasource()
    : _auth = FirebaseAuth.instance,
      _googleSignIn = GoogleSignIn(scopes: ['email']),
      _firestore = FirebaseFirestore.instance;

  Future<Either<AppException, AuthUserDto>> signInWithGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return Left(
          AppException(
            message: 'Google sign-in was cancelled by user',
            statusCode: 401,
            identifier: 'google_sign_in_cancelled',
          ),
        );
      }

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final userCredential = await _auth.signInWithCredential(credential);

      final user = userCredential.user;

      if (user == null) {
        return Left(
          AppException(
            message: 'Firebase authentication failed',
            statusCode: 401,
            identifier: 'firebase_auth_failed',
          ),
        );
      }

      await createUserInFirestore();

      return Right(AuthUserDto.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      await _googleSignIn.signOut();

      // Handle Firebase-specific errors
      String message;
      String identifier;

      switch (e.code) {
        case 'account-exists-with-different-credential':
          message = 'An account already exists with a different sign-in method';
          identifier = 'account_exists_different_credential';
          break;
        case 'invalid-credential':
          message = 'The credential is invalid or expired';
          identifier = 'invalid_credential';
          break;
        case 'operation-not-allowed':
          message = 'Google sign-in is not enabled';
          identifier = 'operation_not_allowed';
          break;
        case 'user-disabled':
          message = 'This user account has been disabled';
          identifier = 'user_disabled';
          break;
        case 'user-not-found':
          message = 'No user found with this credential';
          identifier = 'user_not_found';
          break;
        case 'wrong-password':
          message = 'Invalid password';
          identifier = 'wrong_password';
          break;
        case 'too-many-requests':
          message = 'Too many failed attempts. Please try again later';
          identifier = 'too_many_requests';
          break;
        case 'network-request-failed':
          message = 'Network error. Please check your connection';
          identifier = 'network_error';
          break;
        default:
          message = 'Firebase authentication failed: ${e.message}';
          identifier = 'firebase_auth_error';
      }

      return Left(
        AppException(message: message, statusCode: 401, identifier: identifier),
      );
    } on PlatformException catch (e) {
      await _googleSignIn.signOut();

      // Handle Google Sign-In platform-specific errors
      String message;
      String identifier;

      switch (e.code) {
        case 'sign_in_failed':
          message = 'Google sign-in failed. Please try again';
          identifier = 'google_sign_in_failed';
          break;
        case 'network_error':
          message = 'Network error during Google sign-in';
          identifier = 'google_network_error';
          break;
        case 'sign_in_cancelled':
          message = 'Google sign-in was cancelled';
          identifier = 'google_sign_in_cancelled';
          break;
        default:
          message = 'Google sign-in error: ${e.message}';
          identifier = 'google_platform_error';
      }

      return Left(
        AppException(message: message, statusCode: 401, identifier: identifier),
      );
    } catch (e) {
      await _googleSignIn.signOut();

      // Handle any other unexpected errors
      return Left(
        AppException(
          message:
              'An unexpected error occurred during sign-in: ${e.toString()}',
          statusCode: 500,
          identifier: 'unexpected_error',
        ),
      );
    }
  }

  Future<void> signOut() async {
    await setOnlineOffline(false);
    await _auth.signOut();
    await _googleSignIn.signOut();
  }

  AuthUserDto? get currentUser {
    final user = _auth.currentUser;

    if (user == null) return null;

    return AuthUserDto.fromFirebaseUser(user);
  }

  Stream<AuthUserDto?> get userChanges {
    return _auth.authStateChanges().map((user) {
      if (user == null) return null;
      return AuthUserDto.fromFirebaseUser(user);
    });
  }

  Future<Either<AppException, void>> createUserInFirestore() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        return Left(
          AppException(
            message: 'No authenticated user found',
            statusCode: 401,
            identifier: 'no_authenticated_user',
          ),
        );
      }

      final userDoc = _firestore.collection('users').doc(user.uid);

      return userDoc
          .set({
            'uid': user.uid,
            'email': user.email,
            'displayName': user.displayName,
            'photoURL': user.photoURL,
            'createdAt': FieldValue.serverTimestamp(),
          })
          .then((_) => Right(null));
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to create user in Firestore: ${e.toString()}',
          statusCode: 500,
          identifier: 'create_user_firestore_error',
        ),
      );
    }
  }

  Future<void> setOnlineOffline(bool isOnline) async {
    final user = _auth.currentUser;

    if (user == null) return;

    final userDoc = _firestore.collection('users').doc(user.uid);

    await userDoc.update({
      'isOnline': isOnline,
      'lastSeen': FieldValue.serverTimestamp(),
    });
  }
}
