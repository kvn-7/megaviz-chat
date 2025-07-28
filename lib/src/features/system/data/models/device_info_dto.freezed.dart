// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceInfoDto {

 String? get os; String? get version; String? get model; String? get brand;
/// Create a copy of DeviceInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceInfoDtoCopyWith<DeviceInfoDto> get copyWith => _$DeviceInfoDtoCopyWithImpl<DeviceInfoDto>(this as DeviceInfoDto, _$identity);

  /// Serializes this DeviceInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceInfoDto&&(identical(other.os, os) || other.os == os)&&(identical(other.version, version) || other.version == version)&&(identical(other.model, model) || other.model == model)&&(identical(other.brand, brand) || other.brand == brand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,os,version,model,brand);

@override
String toString() {
  return 'DeviceInfoDto(os: $os, version: $version, model: $model, brand: $brand)';
}


}

/// @nodoc
abstract mixin class $DeviceInfoDtoCopyWith<$Res>  {
  factory $DeviceInfoDtoCopyWith(DeviceInfoDto value, $Res Function(DeviceInfoDto) _then) = _$DeviceInfoDtoCopyWithImpl;
@useResult
$Res call({
 String? os, String? version, String? model, String? brand
});




}
/// @nodoc
class _$DeviceInfoDtoCopyWithImpl<$Res>
    implements $DeviceInfoDtoCopyWith<$Res> {
  _$DeviceInfoDtoCopyWithImpl(this._self, this._then);

  final DeviceInfoDto _self;
  final $Res Function(DeviceInfoDto) _then;

/// Create a copy of DeviceInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? os = freezed,Object? version = freezed,Object? model = freezed,Object? brand = freezed,}) {
  return _then(_self.copyWith(
os: freezed == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceInfoDto].
extension DeviceInfoDtoPatterns on DeviceInfoDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceInfoDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _DeviceInfoDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceInfoDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? os,  String? version,  String? model,  String? brand)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceInfoDto() when $default != null:
return $default(_that.os,_that.version,_that.model,_that.brand);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? os,  String? version,  String? model,  String? brand)  $default,) {final _that = this;
switch (_that) {
case _DeviceInfoDto():
return $default(_that.os,_that.version,_that.model,_that.brand);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? os,  String? version,  String? model,  String? brand)?  $default,) {final _that = this;
switch (_that) {
case _DeviceInfoDto() when $default != null:
return $default(_that.os,_that.version,_that.model,_that.brand);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceInfoDto implements DeviceInfoDto {
  const _DeviceInfoDto({required this.os, required this.version, required this.model, required this.brand});
  factory _DeviceInfoDto.fromJson(Map<String, dynamic> json) => _$DeviceInfoDtoFromJson(json);

@override final  String? os;
@override final  String? version;
@override final  String? model;
@override final  String? brand;

/// Create a copy of DeviceInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceInfoDtoCopyWith<_DeviceInfoDto> get copyWith => __$DeviceInfoDtoCopyWithImpl<_DeviceInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceInfoDto&&(identical(other.os, os) || other.os == os)&&(identical(other.version, version) || other.version == version)&&(identical(other.model, model) || other.model == model)&&(identical(other.brand, brand) || other.brand == brand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,os,version,model,brand);

@override
String toString() {
  return 'DeviceInfoDto(os: $os, version: $version, model: $model, brand: $brand)';
}


}

/// @nodoc
abstract mixin class _$DeviceInfoDtoCopyWith<$Res> implements $DeviceInfoDtoCopyWith<$Res> {
  factory _$DeviceInfoDtoCopyWith(_DeviceInfoDto value, $Res Function(_DeviceInfoDto) _then) = __$DeviceInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String? os, String? version, String? model, String? brand
});




}
/// @nodoc
class __$DeviceInfoDtoCopyWithImpl<$Res>
    implements _$DeviceInfoDtoCopyWith<$Res> {
  __$DeviceInfoDtoCopyWithImpl(this._self, this._then);

  final _DeviceInfoDto _self;
  final $Res Function(_DeviceInfoDto) _then;

/// Create a copy of DeviceInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? os = freezed,Object? version = freezed,Object? model = freezed,Object? brand = freezed,}) {
  return _then(_DeviceInfoDto(
os: freezed == os ? _self.os : os // ignore: cast_nullable_to_non_nullable
as String?,version: freezed == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String?,model: freezed == model ? _self.model : model // ignore: cast_nullable_to_non_nullable
as String?,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
