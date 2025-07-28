// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/widgets.dart';

extension NumberExtension on num {
  String get count {
    if (this >= 1000000) {
      final count = this / 1000000;
      return '${count.toStringAsFixed(count.truncateToDouble() == count ? 0 : 1)}M';
    } else if (this >= 1000) {
      final count = this / 1000;
      return '${count.toStringAsFixed(count.truncateToDouble() == count ? 0 : 1)}K';
    } else {
      return toString();
    }
  }

  // double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);
  double h(BuildContext context) => (this * 1);
  // double get fSize => ((this * _width) / FIGMA_DESIGN_WIDTH);

  double get fSize => (this * 1);
}
