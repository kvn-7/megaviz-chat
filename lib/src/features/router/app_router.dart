import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/auth_user_provider.dart';
import 'package:megaviz_chat/src/features/auth/presentation/views/sign_in_screen.dart';
import 'package:megaviz_chat/src/features/auth/presentation/views/widgets/sign_out_button.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:megaviz_chat/src/features/analytics/presentation/providers/analytics_utils_provider.dart';
import 'package:megaviz_chat/src/features/bottom_navigation/bottom_navigation.dart';
import 'package:megaviz_chat/src/features/splash/presentation/views/splash_screen.dart';

part 'app_router.g.dart';

enum AppRoutes {
  initial(name: 'Initial', path: '/'),
  signIn(name: 'SignIn', path: '/sign-in'),
  chat(name: 'Chat', path: '/chat'),
  profile(name: 'Profile', path: '/profile');

  const AppRoutes({required this.name, required this.path});

  final String name;
  final String path;
}

@riverpod
class AppRouterProvider extends _$AppRouterProvider {
  final _rootNavigatorKey = GlobalKey<NavigatorState>();
  final _portfolioTabNavigatorKey = GlobalKey<NavigatorState>();
  final _profileTabNavigatorKey = GlobalKey<NavigatorState>();

  @override
  GoRouter build() {
    final authListenable = ValueNotifier<(AuthUser?, bool)>((null, false));
    final onBoardListenable = ValueNotifier<(bool?, bool)>((null, false));

    ref.listen(authUserProvider, (_, user) {
      authListenable.value = (user.valueOrNull, true);
    });

    final router = GoRouter(
      initialLocation: AppRoutes.initial.path,
      debugLogDiagnostics: true,
      refreshListenable: Listenable.merge([authListenable, onBoardListenable]),
      navigatorKey: _rootNavigatorKey,
      redirect: (context, state) {
        final authState = ref.read(authUserProvider);

        final isLoggedIn = authState.valueOrNull != null;

        final isLoggingIn = state.fullPath == AppRoutes.signIn.path;
        final isInitialRoute = state.fullPath == AppRoutes.initial.path;

        final loadingAuthUser = authState.isLoading;

        if ((loadingAuthUser) && isInitialRoute) {
          return AppRoutes.initial.path;
        }

        // if (alreadyOnBoarded) {
        //   return AppRoutes.signIn.path;
        // }

        // If we're on the initial route, redirect based on auth state
        if (isInitialRoute) {
          return isLoggedIn ? AppRoutes.chat.path : AppRoutes.signIn.path;
        }

        // For other routes, apply the previous logic
        if (!isLoggedIn && !isLoggingIn) {
          return AppRoutes.signIn.path;
        }

        if (isLoggedIn && isLoggingIn) {
          return AppRoutes.chat.path;
        }

        // if (isLoggedIn) {
        //   return AppRoutes.chat.path;
        // }

        return null;
      },
      routes: [
        GoRoute(
          path: AppRoutes.initial.path,
          name: AppRoutes.initial.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.signIn.path,
          name: AppRoutes.signIn.name,
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) => SignInScreen(),
        ),
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          branches: [
            StatefulShellBranch(
              navigatorKey: _portfolioTabNavigatorKey,
              observers: [GoRouterObserver(ref)],
              routes: [
                GoRoute(
                  path: AppRoutes.chat.path,
                  name: AppRoutes.chat.name,
                  pageBuilder: (context, GoRouterState state) {
                    return MaterialPage(
                      key: state.pageKey,
                      name: state.name,
                      child: AppScaffold(
                        appBar: AppBar(actions: [const SignOutButton()]),
                        body: Column(),
                      ),
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: _profileTabNavigatorKey,
              observers: [GoRouterObserver(ref)],
              routes: [
                GoRoute(
                  path: AppRoutes.profile.path,
                  name: AppRoutes.profile.name,
                  pageBuilder: (context, GoRouterState state) {
                    return MaterialPage(
                      key: state.pageKey,
                      name: state.name,
                      child: Container(),
                    );
                  },
                ),
              ],
            ),
          ],
          pageBuilder:
              (
                BuildContext context,
                GoRouterState state,
                StatefulNavigationShell navigationShell,
              ) {
                return MaterialPage(
                  key: state.pageKey,
                  name: state.name,
                  child: BottomNavigationPage(child: navigationShell),
                );
              },
        ),
      ],
      observers: [GoRouterObserver(ref)],
    );

    ref.onDispose(() {
      authListenable.dispose();
      onBoardListenable.dispose();
      router.dispose();
    });

    return router;
  }
}

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver(this.ref);

  final Ref ref;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRoute(route);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logRoute(previousRoute);
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _logRoute(newRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  void _logRoute(Route<dynamic>? route) {
    log('Route: ${route?.settings.name}');
    if (route != null && route.settings.name != null) {
      ref
          .read(analyticsUtilsProvider)
          .screenView(route.settings.name ?? 'unknown');
    }
  }
}
