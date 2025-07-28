import 'package:megaviz_chat/src/features/system/application/providers/repositories/system_repository_provider.dart';
import 'package:megaviz_chat/src/features/system/domain/use_cases/get_device_info_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_device_info_use_case_provider.g.dart';

@riverpod
class GetDeviceInfoUseCaseProvider extends _$GetDeviceInfoUseCaseProvider {
  @override
  GetDeviceInfoUseCase build() {
    return GetDeviceInfoUseCase(ref.watch(systemRepositoryProvider));
  }
}
