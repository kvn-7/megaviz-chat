import 'package:megaviz_chat/src/features/system/domain/entities/device_info.dart';
import 'package:megaviz_chat/src/features/system/domain/repositories/system_repository.dart';

class GetDeviceInfoUseCase {
  final ISystemRepository repository;

  GetDeviceInfoUseCase(this.repository);

  Future<DeviceInfo?> call() {
    return repository.getDeviceInfo();
  }
}
