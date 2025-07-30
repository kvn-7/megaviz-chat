// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SendNotification {

 String get recipientToken; String get senderName; String get messageContent; String get chatId;
/// Create a copy of SendNotification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendNotificationCopyWith<SendNotification> get copyWith => _$SendNotificationCopyWithImpl<SendNotification>(this as SendNotification, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendNotification&&(identical(other.recipientToken, recipientToken) || other.recipientToken == recipientToken)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.messageContent, messageContent) || other.messageContent == messageContent)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,recipientToken,senderName,messageContent,chatId);

@override
String toString() {
  return 'SendNotification(recipientToken: $recipientToken, senderName: $senderName, messageContent: $messageContent, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class $SendNotificationCopyWith<$Res>  {
  factory $SendNotificationCopyWith(SendNotification value, $Res Function(SendNotification) _then) = _$SendNotificationCopyWithImpl;
@useResult
$Res call({
 String recipientToken, String senderName, String messageContent, String chatId
});




}
/// @nodoc
class _$SendNotificationCopyWithImpl<$Res>
    implements $SendNotificationCopyWith<$Res> {
  _$SendNotificationCopyWithImpl(this._self, this._then);

  final SendNotification _self;
  final $Res Function(SendNotification) _then;

/// Create a copy of SendNotification
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


/// Adds pattern-matching-related methods to [SendNotification].
extension SendNotificationPatterns on SendNotification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendNotification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendNotification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendNotification value)  $default,){
final _that = this;
switch (_that) {
case _SendNotification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendNotification value)?  $default,){
final _that = this;
switch (_that) {
case _SendNotification() when $default != null:
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
case _SendNotification() when $default != null:
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
case _SendNotification():
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
case _SendNotification() when $default != null:
return $default(_that.recipientToken,_that.senderName,_that.messageContent,_that.chatId);case _:
  return null;

}
}

}

/// @nodoc


class _SendNotification implements SendNotification {
  const _SendNotification({required this.recipientToken, required this.senderName, required this.messageContent, required this.chatId});
  

@override final  String recipientToken;
@override final  String senderName;
@override final  String messageContent;
@override final  String chatId;

/// Create a copy of SendNotification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendNotificationCopyWith<_SendNotification> get copyWith => __$SendNotificationCopyWithImpl<_SendNotification>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendNotification&&(identical(other.recipientToken, recipientToken) || other.recipientToken == recipientToken)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.messageContent, messageContent) || other.messageContent == messageContent)&&(identical(other.chatId, chatId) || other.chatId == chatId));
}


@override
int get hashCode => Object.hash(runtimeType,recipientToken,senderName,messageContent,chatId);

@override
String toString() {
  return 'SendNotification(recipientToken: $recipientToken, senderName: $senderName, messageContent: $messageContent, chatId: $chatId)';
}


}

/// @nodoc
abstract mixin class _$SendNotificationCopyWith<$Res> implements $SendNotificationCopyWith<$Res> {
  factory _$SendNotificationCopyWith(_SendNotification value, $Res Function(_SendNotification) _then) = __$SendNotificationCopyWithImpl;
@override @useResult
$Res call({
 String recipientToken, String senderName, String messageContent, String chatId
});




}
/// @nodoc
class __$SendNotificationCopyWithImpl<$Res>
    implements _$SendNotificationCopyWith<$Res> {
  __$SendNotificationCopyWithImpl(this._self, this._then);

  final _SendNotification _self;
  final $Res Function(_SendNotification) _then;

/// Create a copy of SendNotification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? recipientToken = null,Object? senderName = null,Object? messageContent = null,Object? chatId = null,}) {
  return _then(_SendNotification(
recipientToken: null == recipientToken ? _self.recipientToken : recipientToken // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,messageContent: null == messageContent ? _self.messageContent : messageContent // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
