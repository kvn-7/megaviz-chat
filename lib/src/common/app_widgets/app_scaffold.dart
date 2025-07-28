import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:megaviz_chat/src/utils/extensions/context_extensions.dart';

class AppScaffold extends ConsumerWidget {
  const AppScaffold({
    required this.body,
    super.key,
    this.scaffoldKey,
    this.bgColor,
    this.appBar,
    this.bottomNavigationBar,
    this.drawer,
    this.floatingActionButton,
    this.showHeader = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    this.floatingActionButtonLocation =
        FloatingActionButtonLocation.centerFloat,
    this.loadingOverlay = false,
    this.extendBodyBehindAppBar = false,
  });

  final Key? scaffoldKey;
  final Widget body;
  final Color? bgColor;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final bool showHeader;
  final EdgeInsetsGeometry padding;
  final FloatingActionButtonLocation floatingActionButtonLocation;
  final bool loadingOverlay;
  final bool extendBodyBehindAppBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onDoubleTap: kDebugMode ? () {} : null,
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBar,
        bottomNavigationBar: bottomNavigationBar,
        backgroundColor: bgColor,
        drawer: drawer,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        body: kIsWeb
            ? Center(
                child: SizedBox(
                  width: kIsWeb ? max(1000, context.screenWidth * 0.5) : null,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: Padding(padding: padding, child: body),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Padding(padding: padding, child: body),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
