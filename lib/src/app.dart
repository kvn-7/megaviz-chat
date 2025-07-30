import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/set_online_offline_status_state_provider.dart';
import 'package:megaviz_chat/src/features/localization/app_language.dart';
import 'package:megaviz_chat/src/features/router/app_router.dart';
import 'package:megaviz_chat/src/features/theme/app_theme.dart';
import 'package:megaviz_chat/src/l10n/app_localizations.dart';

class EventTaskManagement extends ConsumerWidget {
  const EventTaskManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = ref.watch(appLanguageProvider);
    final router = ref.watch(appRouterProvider);
    final themeType =
        ref.watch(appThemeTypeProvider).valueOrNull ?? UserThemeType.light;

    ref.watch(setOnlineOfflineStatusStateProvider);

    return MaterialApp.router(
      title: 'MegaViz Chat',
      theme: AppTheme.getTheme(type: themeType.themeType(context)),
      themeMode: ref.watch(appThemeTypeProvider).valueOrNull?.themeMode,
      locale: Locale(lang.code),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: router,
      builder: (context, child) {
        // Setting a custom text scale factor
        return MediaQuery(
          data: MediaQuery.of(
            context,
          ).copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
    );
  }
}
