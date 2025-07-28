import 'package:megaviz_chat/src/features/system/data/models/device_info_dto.dart';
import 'package:megaviz_chat/src/features/system/data/sources/device_info_data_source.dart';
import 'package:megaviz_chat/src/features/system/domain/entities/device_info.dart';
import 'package:megaviz_chat/src/features/system/domain/repositories/system_repository.dart';

class SystemRepositoryImpl implements ISystemRepository {
  final DeviceInfoDataSource deviceInfoDataSource;

  SystemRepositoryImpl({required this.deviceInfoDataSource});

  @override
  Future<DeviceInfo?> getDeviceInfo() async {
    final response = await deviceInfoDataSource.getDeviceInfo();

    return response?.toDomain();
  }
}
