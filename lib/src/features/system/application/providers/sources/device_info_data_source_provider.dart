import 'package:megaviz_chat/src/features/system/data/sources/device_info_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info_data_source_provider.g.dart';

@riverpod
class DeviceInfoDataSourceProvider extends _$DeviceInfoDataSourceProvider {
  @override
  DeviceInfoDataSource build() {
    return DeviceInfoDataSource();
  }
}
