import 'package:megaviz_chat/src/features/cloud_storage/data/sources/cloud_storage_remote_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cloud_storage_remote_data_source_provider.g.dart';

@riverpod
class CloudStorageRemoteDataSourceProvider
    extends _$CloudStorageRemoteDataSourceProvider {
  @override
  CloudStorageRemoteDataSource build() {
    return CloudStorageRemoteDataSource();
  }
}
