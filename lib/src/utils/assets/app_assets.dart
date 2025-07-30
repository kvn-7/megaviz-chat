import 'package:flutter/widgets.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppAssets {
  static const images = 'assets/images';
  String appLogo(BuildContext context) => context.isDarkMode
      ? '$images/app_logo_dark.png'
      : '$images/app_logo_light.png';
  static const defaultProfile = '$images/default_profile.png';

  static const icons = 'assets/icons';
  static const tasks = '$icons/tasks.svg';
  static const profile = '$icons/profile.svg';
  static const search = '$icons/search.svg';
  static const google = '$icons/google.svg';
  static const messages = '$icons/messages.svg';
  static const send = '$icons/send.svg';
  static const facebook = '$icons/facebook.svg';
}
