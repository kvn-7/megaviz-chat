// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:megaviz_chat/src/common/app_widgets/app_icon.dart';
// import 'package:megaviz_chat/src/common/app_widgets/app_spaces.dart';
// import 'package:megaviz_chat/src/common/app_widgets/app_text.dart';
// import 'package:megaviz_chat/src/features/auth/presentation/providers/auth_user_provider.dart';
// import 'package:megaviz_chat/src/features/businesses/presentation/providers/user_businesses_provider.dart';
// import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

// class AppBusinessWidget extends ConsumerWidget {
//   const AppBusinessWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final businesses = ref.watch(userBusinessesProvider).valueOrNull;

//     final authUser = ref.read(authUserProvider).valueOrNull;

//     final business =
//         businesses?.businesses
//             .where((element) => element.id == authUser?.businessId)
//             .firstOrNull;

//     return Row(
//       children: [
//         AppIcon(
//           onPressed: null,
//           icon: Icons.business,
//           size: 32,
//           color: context.colorScheme.primary,
//         ),
//         AppSpaces.h8,
//         AppText(
//           text: business?.businessName ?? '',
//           style: context.textTheme.titleLarge?.copyWith(
//             color: context.colorScheme.primary,
//           ),
//         ),
//       ],
//     );
//   }
// }
