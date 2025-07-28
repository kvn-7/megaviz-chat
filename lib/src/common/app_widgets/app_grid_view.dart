import 'package:flutter/material.dart';

class AppGridView extends StatelessWidget {
  const AppGridView({
    required this.crossAxisCount,
    required this.itemHeight,
    required this.children,
    this.mainAxisSpacing = 0,
    this.crossAxisSpacing = 0,
    super.key,
    this.axisDirection,
    this.controller,
    this.shrinkWrap = false,
    this.physics,
  });

  final int crossAxisCount;
  final double itemHeight;
  final List<Widget> children;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final AxisDirection? axisDirection;
  final ScrollController? controller;
  final bool shrinkWrap;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Total width
        var width = constraints.maxWidth;

        // removing total [crossAxisSpacing] from width
        width = width - crossAxisCount * crossAxisSpacing;

        // gets one item height
        final itemWidth = width / crossAxisCount;

        return GridView.count(
          controller: controller,
          shrinkWrap: shrinkWrap,
          physics: physics,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: itemWidth / itemHeight,
          children: children,
        );
      },
    );
  }
}
