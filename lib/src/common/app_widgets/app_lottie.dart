import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLottie extends StatelessWidget {
  const AppLottie({
    super.key,
    required this.path,
    this.height,
    this.width,
    this.fit,
  });

  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(path, height: height, width: width, fit: fit);
  }
}
