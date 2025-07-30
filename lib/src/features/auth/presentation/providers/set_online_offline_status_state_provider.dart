import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/features/auth/application/providers/use_cases/set_online_offline_status_use_case_provider.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/app_lifecycle_provider.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/auth_user_provider.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'set_online_offline_status_state_provider.g.dart';

@riverpod
class SetOnlineOfflineStatusStateProvider
    extends _$SetOnlineOfflineStatusStateProvider {
  @override
  Future<bool> build() async {
    ref.watch(authUserProvider);

    final useCase = ref.read(setOnlineOfflineStatusUseCaseProvider);
    useCase(true);

    ref.listen(appLifecycleProvider, (previous, next) {
      if (next == AppLifecycleState.resumed) {
        setStatus(true);
      } else if (next == AppLifecycleState.paused ||
          next == AppLifecycleState.inactive) {
        setStatus(false);
      }
    });

    return true;
  }

  Future<void> setStatus(bool isOnline) async {
    state = const AsyncLoading();

    final useCase = ref.read(setOnlineOfflineStatusUseCaseProvider);
    await useCase(isOnline);

    state = const AsyncData(true);
  }
}

class MockSetOnlineOfflineStatusStateProvider
    extends _$SetOnlineOfflineStatusStateProvider
    with Mock
    implements SetOnlineOfflineStatusStateProvider {}
