import 'package:megaviz_chat/src/features/notifications/application/providers/repositories/notifications_repository_provider.dart';
import 'package:megaviz_chat/src/features/notifications/domain/use_cases/get_fcm_token_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_fcm_token_use_case_provider.g.dart';

@riverpod
class GetFcmTokenUseCaseProvider extends _$GetFcmTokenUseCaseProvider {
  @override
  GetFcmTokenUseCase build() {
    return GetFcmTokenUseCase(ref.read(notificationsRepositoryProvider));
  }
}

class MockGetFcmTokenUseCaseProvider extends _$GetFcmTokenUseCaseProvider
    with Mock
    implements GetFcmTokenUseCaseProvider {}
