// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeviceInfoDto _$DeviceInfoDtoFromJson(Map<String, dynamic> json) =>
    _DeviceInfoDto(
      os: json['os'] as String?,
      version: json['version'] as String?,
      model: json['model'] as String?,
      brand: json['brand'] as String?,
    );

Map<String, dynamic> _$DeviceInfoDtoToJson(_DeviceInfoDto instance) =>
    <String, dynamic>{
      if (instance.os case final value?) 'os': value,
      if (instance.version case final value?) 'version': value,
      if (instance.model case final value?) 'model': value,
      if (instance.brand case final value?) 'brand': value,
    };
