import 'package:megaviz_chat/src/features/system/application/providers/use_cases/get_device_info_use_case_provider.dart';
import 'package:megaviz_chat/src/features/system/domain/entities/device_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_info_provider.g.dart';

@riverpod
class DeviceInfoProvider extends _$DeviceInfoProvider {
  @override
  FutureOr<DeviceInfo?> build() async {
    final useCase = ref.watch(getDeviceInfoUseCaseProvider);

    final result = await useCase();

    return result;
  }
}
