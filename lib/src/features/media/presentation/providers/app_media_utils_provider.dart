import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_media_utils_provider.g.dart';

class AppMediaUtils {
  Future<XFile?> pickImage({
    ImageSource source = ImageSource.gallery,
    bool crop = false,
    double ratioX = 1,
    double ratioY = 1,
    bool circle = true,
  }) async {
    final image = await ImagePicker().pickImage(source: source);

    if (image == null) return null;

    if (kIsWeb) {
      return image;
    }

    final bytes = await image.readAsBytes();

    File(image.path).writeAsBytesSync(bytes);

    return XFile(image.path);
  }
}

@riverpod
class AppMediaUtilsProvider extends _$AppMediaUtilsProvider {
  @override
  AppMediaUtils build() {
    return AppMediaUtils();
  }
}
