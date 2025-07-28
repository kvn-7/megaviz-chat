import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megaviz_chat/src/features/system/domain/entities/device_info.dart';

part 'device_info_dto.freezed.dart';
part 'device_info_dto.g.dart';

@freezed
abstract class DeviceInfoDto with _$DeviceInfoDto {
  const factory DeviceInfoDto({
    required String? os,
    required String? version,
    required String? model,
    required String? brand,
  }) = _DeviceInfoDto;

  factory DeviceInfoDto.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoDtoFromJson(json);
}

extension DeviceInfoDtoX on DeviceInfoDto {
  DeviceInfo toDomain() {
    return DeviceInfo(os: os, version: version, model: model, brand: brand);
  }
}
