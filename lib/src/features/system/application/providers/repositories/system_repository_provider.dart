import 'package:megaviz_chat/src/features/system/application/providers/sources/device_info_data_source_provider.dart';
import 'package:megaviz_chat/src/features/system/data/repositories/system_repository_impl.dart';
import 'package:megaviz_chat/src/features/system/domain/repositories/system_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'system_repository_provider.g.dart';

@riverpod
class SystemRepositoryProvider extends _$SystemRepositoryProvider {
  @override
  ISystemRepository build() {
    return SystemRepositoryImpl(
      deviceInfoDataSource: ref.watch(deviceInfoDataSourceProvider),
    );
  }
}
