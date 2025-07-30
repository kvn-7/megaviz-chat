import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:megaviz_chat/src/common/app_widgets/app_svg.dart';
import 'package:megaviz_chat/src/utils/assets/app_assets.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class BottomNavigationPage extends ConsumerStatefulWidget {
  const BottomNavigationPage({required this.child, super.key});

  final StatefulNavigationShell child;

  @override
  ConsumerState<BottomNavigationPage> createState() =>
      _BottomNavigationPageState();
}

class _BottomNavigationPageState extends ConsumerState<BottomNavigationPage> {
  @override
  Widget build(BuildContext context) {
    final items = [
      AppBottomNavItem(
        path: AppAssets.messages,
        label: context.appLocalizations.chat,
      ),
      AppBottomNavItem(
        path: AppAssets.profile,
        label: context.appLocalizations.profile,
      ),
    ];

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: SizedBox(
          // height: fullView ? 0 : null,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.child.currentIndex,
            onTap: (index) {
              widget.child.goBranch(
                index,
                initialLocation: index == widget.child.currentIndex,
              );
              setState(() {});
            },
            iconSize: 20,
            items: items
                .map(
                  (item) => BottomNavigationBarItem(
                    icon: AppSvg(
                      path: item.path,
                      color: context.colorScheme.onSurface,
                    ),
                    activeIcon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: AppSvg(
                        path: item.path,
                        color: context.colorScheme.onPrimary,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    label: item.label,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class AppBottomNavItem {
  const AppBottomNavItem({required this.path, required this.label});

  final String path;
  final String label;
}
