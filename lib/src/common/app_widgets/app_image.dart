import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:megaviz_chat/src/utils/assets/app_assets.dart';
// import 'package:photo_view/photo_view.dart';

class AppImage {
  /// Network Image
  static Widget network({
    required String? url,
    BorderRadius? radius,
    BoxFit? fit,
    double? height,
    double? width,
    String? defaultImage,
  }) {
    if (url == '' || url == null) {
      return asset(
        path: defaultImage ?? AppAssets.defaultProfile,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        radius: radius,
      );
    }
    return shapeImage(
      radius: radius,
      image: Image.network(
        url,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return asset(
            path: defaultImage ?? AppAssets.defaultProfile,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            radius: radius,
          );
        },
      ),
    );
  }

  /// File Image
  static Widget file({
    required String path,
    BorderRadius? radius,
    BoxFit? fit,
    double? height,
    double? width,
    String? defaultImage,
  }) {
    if (path == '') {
      return asset(
        path: defaultImage ?? AppAssets.defaultProfile,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        radius: radius,
      );
    }
    if (kIsWeb) {
      return shapeImage(
        radius: radius,
        image: Image.network(path, fit: fit, height: height, width: width),
      );
    }
    return shapeImage(
      radius: radius,
      image: Image.file(File(path), fit: fit, height: height, width: width),
    );
  }

  static Widget asset({
    required String path,
    BorderRadius? radius,
    BoxFit? fit,
    double? height,
    double? width,
    Color? color,
    double? opacity,
  }) {
    return shapeImage(
      radius: radius,
      image: Image.asset(
        path,
        fit: fit,
        height: height,
        width: width,
        color: color,
        opacity: opacity != null ? AlwaysStoppedAnimation(opacity) : null,
      ),
    );
  }

  static Widget shapeImage({
    required BorderRadius? radius,
    required Widget image,
  }) {
    if (radius == null) return image;

    return ClipRRect(borderRadius: radius, child: image);
  }

  // static Widget photoViewNetwork({
  //   required String url,
  // }) {
  //   return PhotoView(
  //     imageProvider: NetworkImage(url),
  //   );
  // }
}
