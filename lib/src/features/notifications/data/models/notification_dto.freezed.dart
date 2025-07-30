// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendNotificationDto {

 String get recipientToken; String get senderName; String get messageContent; String get chatId;
/// Create a copy of SendNotificationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendNotificationDtoCopyWith<SendNotificationDto> get copyWith => _$SendNotificationDtoCopyWithImpl<SendNotificationDto>(this as SendNotificationDto, _$identity);

  /// Serializes this SendNotificationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendNotificationDto&&(identical(other.recipientToken, recipientToken) || other.recipientToken == recipientToken)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.messageContent, messageContent) || other.messageContent == messageContent)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientToken,senderName,messageContent,chatId);

@override
String toString() {
  return 'SendNotificationDto(recipientToken: $recipientToken, senderName: $senderName, messageContent: $messageContent, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $SendNotificationDtoCopyWith<$Res>  {
  factory $SendNotificationDtoCopyWith(SendNotificationDto value, $Res Function(SendNotificationDto) _then) = _$SendNotificationDtoCopyWithImpl;
@useResult
$Res call({
 String recipientToken, String senderName, String messageContent, String chatId
});




}
/// @nodoc
class _$SendNotificationDtoCopyWithImpl<$Res>
    implements $SendNotificationDtoCopyWith<$Res> {
  _$SendNotificationDtoCopyWithImpl(this._self, this._then);

  final SendNotificationDto _self;
  final $Res Function(SendNotificationDto) _then;

/// Create a copy of SendNotificationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? recipientToken = null,Object? senderName = null,Object? messageContent = null,Object? chatId = null,}) {
  return _then(_self.copyWith(
recipientToken: null == recipientToken ? _self.recipientToken : recipientToken // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,messageContent: null == messageContent ? _self.messageContent : messageContent // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendNotificationDto].
extension SendNotificationDtoPatterns on SendNotificationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendNotificationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendNotificationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendNotificationDto value)  $default,){
final _that = this;
switch (_that) {
case _SendNotificationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendNotificationDto value)?  $default,){
final _that = this;
switch (_that) {
case _SendNotificationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String recipientToken,  String senderName,  String messageContent,  String chatId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendNotificationDto() when $default != null:
return $default(_that.recipientToken,_that.senderName,_that.messageContent,_that.chatId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String recipientToken,  String senderName,  String messageContent,  String chatId)  $default,) {final _that = this;
switch (_that) {
case _SendNotificationDto():
return $default(_that.recipientToken,_that.senderName,_that.messageContent,_that.chatId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String recipientToken,  String senderName,  String messageContent,  String chatId)?  $default,) {final _that = this;
switch (_that) {
case _SendNotificationDto() when $default != null:
return $default(_that.recipientToken,_that.senderName,_that.messageContent,_that.chatId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendNotificationDto implements SendNotificationDto {
  const _SendNotificationDto({required this.recipientToken, required this.senderName, required this.messageContent, required this.chatId});
  factory _SendNotificationDto.fromJson(Map<String, dynamic> json) => _$SendNotificationDtoFromJson(json);

@override final  String recipientToken;
@override final  String senderName;
@override final  String messageContent;
@override final  String chatId;

/// Create a copy of SendNotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendNotificationDtoCopyWith<_SendNotificationDto> get copyWith => __$SendNotificationDtoCopyWithImpl<_SendNotificationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendNotificationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendNotificationDto&&(identical(other.recipientToken, recipientToken) || other.recipientToken == recipientToken)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.messageContent, messageContent) || other.messageContent == messageContent)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,recipientToken,senderName,messageContent,chatId);

@override
String toString() {
  return 'SendNotificationDto(recipientToken: $recipientToken, senderName: $senderName, messageContent: $messageContent, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$SendNotificationDtoCopyWith<$Res> implements $SendNotificationDtoCopyWith<$Res> {
  factory _$SendNotificationDtoCopyWith(_SendNotificationDto value, $Res Function(_SendNotificationDto) _then) = __$SendNotificationDtoCopyWithImpl;
@override @useResult
$Res call({
 String recipientToken, String senderName, String messageContent, String chatId
});




}
/// @nodoc
class __$SendNotificationDtoCopyWithImpl<$Res>
    implements _$SendNotificationDtoCopyWith<$Res> {
  __$SendNotificationDtoCopyWithImpl(this._self, this._then);

  final _SendNotificationDto _self;
  final $Res Function(_SendNotificationDto) _then;

/// Create a copy of SendNotificationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientToken = null,Object? senderName = null,Object? messageContent = null,Object? chatId = null,}) {
  return _then(_SendNotificationDto(
recipientToken: null == recipientToken ? _self.recipientToken : recipientToken // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,messageContent: null == messageContent ? _self.messageContent : messageContent // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
