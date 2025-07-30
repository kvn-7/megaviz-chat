import 'package:megaviz_chat/src/features/cloud_storage/application/providers/sources/cloud_storage_remote_data_source_provider.dart';
import 'package:megaviz_chat/src/features/cloud_storage/data/repositories/cloud_storage_repository.dart';
import 'package:megaviz_chat/src/features/cloud_storage/domain/repositories/cloud_storage_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloud_storage_repository_provider.g.dart';

@riverpod
class CloudStorageRepositoryProvider extends _$CloudStorageRepositoryProvider {
  @override
  ICloudStorageRepository build() {
    return CloudStorageRepository(
      ref.watch(cloudStorageRemoteDataSourceProvider),
    );
  }
}
