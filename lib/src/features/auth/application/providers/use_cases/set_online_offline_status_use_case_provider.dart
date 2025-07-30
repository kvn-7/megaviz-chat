import 'package:megaviz_chat/src/features/auth/application/providers/repositories/auth_repository_provider.dart';
import 'package:megaviz_chat/src/features/auth/domain/use_cases/set_online_offline_status_use_case.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'set_online_offline_status_use_case_provider.g.dart';

@riverpod
class SetOnlineOfflineStatusUseCaseProvider
    extends _$SetOnlineOfflineStatusUseCaseProvider {
  @override
  SetOnlineOfflineStatusUseCase build() {
    return SetOnlineOfflineStatusUseCase(ref.read(authRepositoryProvider));
  }
}

class MockSetOnlineOfflineStatusUseCaseProvider
    extends _$SetOnlineOfflineStatusUseCaseProvider
    with Mock
    implements SetOnlineOfflineStatusUseCaseProvider {}
