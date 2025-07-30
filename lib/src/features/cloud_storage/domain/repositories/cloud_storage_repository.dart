import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';

abstract class ICloudStorageRepository {
  Future<Either<AppException, String>> uploadFile(
    String filePath,
    String destinationPath,
  );
}
