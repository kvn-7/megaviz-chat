// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserDto _$AuthUserDtoFromJson(Map<String, dynamic> json) => _AuthUserDto(
  id: json['id'] as String,
  email: json['email'] as String,
  name: json['name'] as String,
  photoUrl: json['photoUrl'] as String?,
);

Map<String, dynamic> _$AuthUserDtoToJson(_AuthUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      if (instance.photoUrl case final value?) 'photoUrl': value,
    };
