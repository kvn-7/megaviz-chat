import 'package:megaviz_chat/src/features/system/domain/entities/device_info.dart';

abstract class ISystemRepository {
  Future<DeviceInfo?> getDeviceInfo();
}
