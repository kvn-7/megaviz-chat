import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_icon.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/sign_out_state_provider.dart';

class SignOutButton extends ConsumerWidget {
  const SignOutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppIcon(
      onPressed: () {
        ref.read(signOutStateProvider.notifier).signOut();
      },
      icon: Icons.logout,
    );
  }
}
