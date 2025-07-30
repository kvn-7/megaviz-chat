import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';

class CloudStorageRemoteDataSource {
  final FirebaseStorage _firebaseStorage;

  CloudStorageRemoteDataSource() : _firebaseStorage = FirebaseStorage.instance;

  Future<Either<AppException, String>> uploadFile(
    String filePath,
    String destinationPath,
  ) async {
    try {
      final file = File(filePath);
      final ref = _firebaseStorage.ref(destinationPath);
      await ref.putFile(file);
      return Right(await ref.getDownloadURL());
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to upload file: $e',
          statusCode: 500,
          identifier: 'upload_file',
        ),
      );
    }
  }
}
