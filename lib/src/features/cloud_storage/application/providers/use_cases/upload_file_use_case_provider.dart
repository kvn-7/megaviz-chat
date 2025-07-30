import 'package:megaviz_chat/src/features/cloud_storage/application/providers/repositories/cloud_storage_repository_provider.dart';
import 'package:megaviz_chat/src/features/cloud_storage/domain/use_cases/upload_file_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upload_file_use_case_provider.g.dart';

@riverpod
class UploadFileUseCaseProvider extends _$UploadFileUseCaseProvider {
  @override
  UploadFileUseCase build() {
    return UploadFileUseCase(ref.watch(cloudStorageRepositoryProvider));
  }
}
