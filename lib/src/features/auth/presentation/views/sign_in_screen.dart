import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_logo.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_scaffold.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
import 'package:megaviz_chat/src/features/auth/presentation/providers/sign_in_state_provider.dart';
import 'package:megaviz_chat/src/features/auth/presentation/views/widgets/social_sign_in_widget.dart';
import 'package:megaviz_chat/src/utils/assets/app_assets.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(signInStateProvider);
    final isLoading = provider.isLoading;

    final loadingWithEmail = useState(false);

    Future<void> signInWithGooglePressed() async {
      if (isLoading) return;

      loadingWithEmail.value = true;

      await ref.read(signInStateProvider.notifier).signInWithGoogle();

      loadingWithEmail.value = false;
    }

    Future<void> signInWithFacebookPressed() async {
      if (isLoading) return;

      loadingWithEmail.value = true;

      await ref.read(signInStateProvider.notifier).signInWithFacebook();

      loadingWithEmail.value = false;
    }

    ref.listen(signInStateProvider, (previous, next) {
      final error = next.asError?.error;

      if (error != null && context.mounted) {
        context.showErrorSnackBar(error.toString());
        return;
      }
    });

    return AppScaffold(
      appBar: AppBar(title: const AppLogo()),
      body: ListView(
        children: [
          AppSpaces.v32,
          AppText(
            text: context.appLocalizations.signInTitle,
            style: context.textTheme.titleLarge?.copyWith(fontSize: 28),
          ),
          AppSpaces.v8,
          AppText(text: context.appLocalizations.signInSubTitle),
          AppSpaces.v32,
          SocialSignInWidget(
            name: context.appLocalizations.signInWithGoogle,
            iconPath: AppAssets.google,
            onPressed: signInWithGooglePressed,
          ),
          AppSpaces.v16,
          SocialSignInWidget(
            name: context.appLocalizations.signInWithFacebook,
            iconPath: AppAssets.facebook,
            onPressed: signInWithFacebookPressed,
          ),
          AppSpaces.v32,
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: context.appLocalizations.bySigningAgreeTo,
                  style: context.textTheme.bodySmall,
                ),
                const TextSpan(text: ' '),
                TextSpan(
                  text: context.appLocalizations.tnc,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // launchUrlString(AppUrls.tnc);
                    },
                ),
                TextSpan(
                  text: ' ${context.appLocalizations.and} ',
                  style: context.textTheme.bodySmall,
                ),
                TextSpan(
                  text: context.appLocalizations.privacyPolicy,
                  style: context.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // launchUrlString(AppUrls.privacyPolicy);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
