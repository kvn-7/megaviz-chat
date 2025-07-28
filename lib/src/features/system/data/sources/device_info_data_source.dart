import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:megaviz_chat/src/features/system/data/models/device_info_dto.dart';

class DeviceInfoDataSource {
  Future<DeviceInfoDto?> getDeviceInfo() async {
    try {
      final deviceInfo = DeviceInfoPlugin();

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        return DeviceInfoDto(
          os: 'Android',
          version: androidInfo.version.release,
          model: androidInfo.model,
          brand: androidInfo.brand,
        );
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        return DeviceInfoDto(
          os: 'iOS',
          version: iosInfo.systemVersion,
          model: iosInfo.model,
          brand: 'Apple',
        );
      }

      return null;
    } catch (e) {
      log('Error getting device info: $e');
      return null;
    }
  }
}
