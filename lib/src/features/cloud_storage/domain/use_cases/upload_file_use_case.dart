import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/cloud_storage/domain/repositories/cloud_storage_repository.dart';

class UploadFileUseCase {
  final ICloudStorageRepository repo;

  UploadFileUseCase(this.repo);

  Future<Either<AppException, String>> call(
    String filePath,
    String destinationPath,
  ) async {
    return repo.uploadFile(filePath, destinationPath);
  }
}
