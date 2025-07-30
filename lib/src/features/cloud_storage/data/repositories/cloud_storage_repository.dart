import 'package:megaviz_chat/src/common/models/app_exceptions.dart';
import 'package:megaviz_chat/src/common/models/either.dart';
import 'package:megaviz_chat/src/features/cloud_storage/data/sources/cloud_storage_remote_data_source.dart';
import 'package:megaviz_chat/src/features/cloud_storage/domain/repositories/cloud_storage_repository.dart';

class CloudStorageRepository implements ICloudStorageRepository {
  final CloudStorageRemoteDataSource _remoteDataSource;

  CloudStorageRepository(this._remoteDataSource);

  @override
  Future<Either<AppException, String>> uploadFile(
    String filePath,
    String destinationPath,
  ) async {
    return _remoteDataSource.uploadFile(filePath, destinationPath);
  }
}
