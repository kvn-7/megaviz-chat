// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatDto {

 String get id; String get userId;
/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatDtoCopyWith<ChatDto> get copyWith => _$ChatDtoCopyWithImpl<ChatDto>(this as ChatDto, _$identity);

  /// Serializes this ChatDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId);

@override
String toString() {
  return 'ChatDto(id: $id, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $ChatDtoCopyWith<$Res>  {
  factory $ChatDtoCopyWith(ChatDto value, $Res Function(ChatDto) _then) = _$ChatDtoCopyWithImpl;
@useResult
$Res call({
 String id, String userId
});




}
/// @nodoc
class _$ChatDtoCopyWithImpl<$Res>
    implements $ChatDtoCopyWith<$Res> {
  _$ChatDtoCopyWithImpl(this._self, this._then);

  final ChatDto _self;
  final $Res Function(ChatDto) _then;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatDto].
extension ChatDtoPatterns on ChatDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
return $default(_that.id,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId)  $default,) {final _that = this;
switch (_that) {
case _ChatDto():
return $default(_that.id,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId)?  $default,) {final _that = this;
switch (_that) {
case _ChatDto() when $default != null:
return $default(_that.id,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatDto implements ChatDto {
  const _ChatDto({required this.id, required this.userId});
  factory _ChatDto.fromJson(Map<String, dynamic> json) => _$ChatDtoFromJson(json);

@override final  String id;
@override final  String userId;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatDtoCopyWith<_ChatDto> get copyWith => __$ChatDtoCopyWithImpl<_ChatDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatDto&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId);

@override
String toString() {
  return 'ChatDto(id: $id, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$ChatDtoCopyWith<$Res> implements $ChatDtoCopyWith<$Res> {
  factory _$ChatDtoCopyWith(_ChatDto value, $Res Function(_ChatDto) _then) = __$ChatDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId
});




}
/// @nodoc
class __$ChatDtoCopyWithImpl<$Res>
    implements _$ChatDtoCopyWith<$Res> {
  __$ChatDtoCopyWithImpl(this._self, this._then);

  final _ChatDto _self;
  final $Res Function(_ChatDto) _then;

/// Create a copy of ChatDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,}) {
  return _then(_ChatDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChatUserDto {

 String get uid; String get displayName; String? get photoURL;
/// Create a copy of ChatUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatUserDtoCopyWith<ChatUserDto> get copyWith => _$ChatUserDtoCopyWithImpl<ChatUserDto>(this as ChatUserDto, _$identity);

  /// Serializes this ChatUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatUserDto&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoURL, photoURL) || other.photoURL == photoURL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,displayName,photoURL);

@override
String toString() {
  return 'ChatUserDto(uid: $uid, displayName: $displayName, photoURL: $photoURL)';
}


}

/// @nodoc
abstract mixin class $ChatUserDtoCopyWith<$Res>  {
  factory $ChatUserDtoCopyWith(ChatUserDto value, $Res Function(ChatUserDto) _then) = _$ChatUserDtoCopyWithImpl;
@useResult
$Res call({
 String uid, String displayName, String? photoURL
});




}
/// @nodoc
class _$ChatUserDtoCopyWithImpl<$Res>
    implements $ChatUserDtoCopyWith<$Res> {
  _$ChatUserDtoCopyWithImpl(this._self, this._then);

  final ChatUserDto _self;
  final $Res Function(ChatUserDto) _then;

/// Create a copy of ChatUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? displayName = null,Object? photoURL = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,photoURL: freezed == photoURL ? _self.photoURL : photoURL // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatUserDto].
extension ChatUserDtoPatterns on ChatUserDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatUserDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatUserDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatUserDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatUserDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String displayName,  String? photoURL)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatUserDto() when $default != null:
return $default(_that.uid,_that.displayName,_that.photoURL);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String displayName,  String? photoURL)  $default,) {final _that = this;
switch (_that) {
case _ChatUserDto():
return $default(_that.uid,_that.displayName,_that.photoURL);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String displayName,  String? photoURL)?  $default,) {final _that = this;
switch (_that) {
case _ChatUserDto() when $default != null:
return $default(_that.uid,_that.displayName,_that.photoURL);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatUserDto implements ChatUserDto {
  const _ChatUserDto({required this.uid, required this.displayName, this.photoURL});
  factory _ChatUserDto.fromJson(Map<String, dynamic> json) => _$ChatUserDtoFromJson(json);

@override final  String uid;
@override final  String displayName;
@override final  String? photoURL;

/// Create a copy of ChatUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatUserDtoCopyWith<_ChatUserDto> get copyWith => __$ChatUserDtoCopyWithImpl<_ChatUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatUserDto&&(identical(other.uid, uid) || other.uid == uid)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.photoURL, photoURL) || other.photoURL == photoURL));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uid,displayName,photoURL);

@override
String toString() {
  return 'ChatUserDto(uid: $uid, displayName: $displayName, photoURL: $photoURL)';
}


}

/// @nodoc
abstract mixin class _$ChatUserDtoCopyWith<$Res> implements $ChatUserDtoCopyWith<$Res> {
  factory _$ChatUserDtoCopyWith(_ChatUserDto value, $Res Function(_ChatUserDto) _then) = __$ChatUserDtoCopyWithImpl;
@override @useResult
$Res call({
 String uid, String displayName, String? photoURL
});




}
/// @nodoc
class __$ChatUserDtoCopyWithImpl<$Res>
    implements _$ChatUserDtoCopyWith<$Res> {
  __$ChatUserDtoCopyWithImpl(this._self, this._then);

  final _ChatUserDto _self;
  final $Res Function(_ChatUserDto) _then;

/// Create a copy of ChatUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? displayName = null,Object? photoURL = freezed,}) {
  return _then(_ChatUserDto(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,photoURL: freezed == photoURL ? _self.photoURL : photoURL // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChatMessageDto {

 String get id; String get chatId; ChatMessageContentDto get content; DateTime get timestamp; String get senderId;
/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageDtoCopyWith<ChatMessageDto> get copyWith => _$ChatMessageDtoCopyWithImpl<ChatMessageDto>(this as ChatMessageDto, _$identity);

  /// Serializes this ChatMessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.senderId, senderId) || other.senderId == senderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,content,timestamp,senderId);

@override
String toString() {
  return 'ChatMessageDto(id: $id, chatId: $chatId, content: $content, timestamp: $timestamp, senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class $ChatMessageDtoCopyWith<$Res>  {
  factory $ChatMessageDtoCopyWith(ChatMessageDto value, $Res Function(ChatMessageDto) _then) = _$ChatMessageDtoCopyWithImpl;
@useResult
$Res call({
 String id, String chatId, ChatMessageContentDto content, DateTime timestamp, String senderId
});


$ChatMessageContentDtoCopyWith<$Res> get content;

}
/// @nodoc
class _$ChatMessageDtoCopyWithImpl<$Res>
    implements $ChatMessageDtoCopyWith<$Res> {
  _$ChatMessageDtoCopyWithImpl(this._self, this._then);

  final ChatMessageDto _self;
  final $Res Function(ChatMessageDto) _then;

/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chatId = null,Object? content = null,Object? timestamp = null,Object? senderId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ChatMessageContentDto,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageContentDtoCopyWith<$Res> get content {
  
  return $ChatMessageContentDtoCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatMessageDto].
extension ChatMessageDtoPatterns on ChatMessageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessageDto value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String chatId,  ChatMessageContentDto content,  DateTime timestamp,  String senderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessageDto() when $default != null:
return $default(_that.id,_that.chatId,_that.content,_that.timestamp,_that.senderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String chatId,  ChatMessageContentDto content,  DateTime timestamp,  String senderId)  $default,) {final _that = this;
switch (_that) {
case _ChatMessageDto():
return $default(_that.id,_that.chatId,_that.content,_that.timestamp,_that.senderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String chatId,  ChatMessageContentDto content,  DateTime timestamp,  String senderId)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessageDto() when $default != null:
return $default(_that.id,_that.chatId,_that.content,_that.timestamp,_that.senderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessageDto implements ChatMessageDto {
  const _ChatMessageDto({required this.id, required this.chatId, required this.content, required this.timestamp, required this.senderId});
  factory _ChatMessageDto.fromJson(Map<String, dynamic> json) => _$ChatMessageDtoFromJson(json);

@override final  String id;
@override final  String chatId;
@override final  ChatMessageContentDto content;
@override final  DateTime timestamp;
@override final  String senderId;

/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageDtoCopyWith<_ChatMessageDto> get copyWith => __$ChatMessageDtoCopyWithImpl<_ChatMessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessageDto&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.content, content) || other.content == content)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.senderId, senderId) || other.senderId == senderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,content,timestamp,senderId);

@override
String toString() {
  return 'ChatMessageDto(id: $id, chatId: $chatId, content: $content, timestamp: $timestamp, senderId: $senderId)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageDtoCopyWith<$Res> implements $ChatMessageDtoCopyWith<$Res> {
  factory _$ChatMessageDtoCopyWith(_ChatMessageDto value, $Res Function(_ChatMessageDto) _then) = __$ChatMessageDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String chatId, ChatMessageContentDto content, DateTime timestamp, String senderId
});


@override $ChatMessageContentDtoCopyWith<$Res> get content;

}
/// @nodoc
class __$ChatMessageDtoCopyWithImpl<$Res>
    implements _$ChatMessageDtoCopyWith<$Res> {
  __$ChatMessageDtoCopyWithImpl(this._self, this._then);

  final _ChatMessageDto _self;
  final $Res Function(_ChatMessageDto) _then;

/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chatId = null,Object? content = null,Object? timestamp = null,Object? senderId = null,}) {
  return _then(_ChatMessageDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ChatMessageContentDto,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,senderId: null == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of ChatMessageDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageContentDtoCopyWith<$Res> get content {
  
  return $ChatMessageContentDtoCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}

ChatMessageContentDto _$ChatMessageContentDtoFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'text':
          return TextContentDto.fromJson(
            json
          );
                case 'image':
          return ImageContentDto.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ChatMessageContentDto',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ChatMessageContentDto {



  /// Serializes this ChatMessageContentDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageContentDto);
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatMessageContentDto()';
}


}

/// @nodoc
class $ChatMessageContentDtoCopyWith<$Res>  {
$ChatMessageContentDtoCopyWith(ChatMessageContentDto _, $Res Function(ChatMessageContentDto) __);
}


/// Adds pattern-matching-related methods to [ChatMessageContentDto].
extension ChatMessageContentDtoPatterns on ChatMessageContentDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TextContentDto value)?  text,TResult Function( ImageContentDto value)?  image,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TextContentDto() when text != null:
return text(_that);case ImageContentDto() when image != null:
return image(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TextContentDto value)  text,required TResult Function( ImageContentDto value)  image,}){
final _that = this;
switch (_that) {
case TextContentDto():
return text(_that);case ImageContentDto():
return image(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TextContentDto value)?  text,TResult? Function( ImageContentDto value)?  image,}){
final _that = this;
switch (_that) {
case TextContentDto() when text != null:
return text(_that);case ImageContentDto() when image != null:
return image(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String text)?  text,TResult Function( String imageUrl)?  image,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TextContentDto() when text != null:
return text(_that.text);case ImageContentDto() when image != null:
return image(_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String text)  text,required TResult Function( String imageUrl)  image,}) {final _that = this;
switch (_that) {
case TextContentDto():
return text(_that.text);case ImageContentDto():
return image(_that.imageUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String text)?  text,TResult? Function( String imageUrl)?  image,}) {final _that = this;
switch (_that) {
case TextContentDto() when text != null:
return text(_that.text);case ImageContentDto() when image != null:
return image(_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class TextContentDto implements ChatMessageContentDto {
  const TextContentDto(this.text, {final  String? $type}): $type = $type ?? 'text';
  factory TextContentDto.fromJson(Map<String, dynamic> json) => _$TextContentDtoFromJson(json);

 final  String text;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ChatMessageContentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextContentDtoCopyWith<TextContentDto> get copyWith => _$TextContentDtoCopyWithImpl<TextContentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextContentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextContentDto&&(identical(other.text, text) || other.text == text));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text);

@override
String toString() {
  return 'ChatMessageContentDto.text(text: $text)';
}


}

/// @nodoc
abstract mixin class $TextContentDtoCopyWith<$Res> implements $ChatMessageContentDtoCopyWith<$Res> {
  factory $TextContentDtoCopyWith(TextContentDto value, $Res Function(TextContentDto) _then) = _$TextContentDtoCopyWithImpl;
@useResult
$Res call({
 String text
});




}
/// @nodoc
class _$TextContentDtoCopyWithImpl<$Res>
    implements $TextContentDtoCopyWith<$Res> {
  _$TextContentDtoCopyWithImpl(this._self, this._then);

  final TextContentDto _self;
  final $Res Function(TextContentDto) _then;

/// Create a copy of ChatMessageContentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? text = null,}) {
  return _then(TextContentDto(
null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class ImageContentDto implements ChatMessageContentDto {
  const ImageContentDto(this.imageUrl, {final  String? $type}): $type = $type ?? 'image';
  factory ImageContentDto.fromJson(Map<String, dynamic> json) => _$ImageContentDtoFromJson(json);

 final  String imageUrl;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ChatMessageContentDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageContentDtoCopyWith<ImageContentDto> get copyWith => _$ImageContentDtoCopyWithImpl<ImageContentDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageContentDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImageContentDto&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl);

@override
String toString() {
  return 'ChatMessageContentDto.image(imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $ImageContentDtoCopyWith<$Res> implements $ChatMessageContentDtoCopyWith<$Res> {
  factory $ImageContentDtoCopyWith(ImageContentDto value, $Res Function(ImageContentDto) _then) = _$ImageContentDtoCopyWithImpl;
@useResult
$Res call({
 String imageUrl
});




}
/// @nodoc
class _$ImageContentDtoCopyWithImpl<$Res>
    implements $ImageContentDtoCopyWith<$Res> {
  _$ImageContentDtoCopyWithImpl(this._self, this._then);

  final ImageContentDto _self;
  final $Res Function(ImageContentDto) _then;

/// Create a copy of ChatMessageContentDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imageUrl = null,}) {
  return _then(ImageContentDto(
null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SendMessageDto {

 String? get chatId; String get otherUserId; ChatMessageContentDto get content;
/// Create a copy of SendMessageDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageDtoCopyWith<SendMessageDto> get copyWith => _$SendMessageDtoCopyWithImpl<SendMessageDto>(this as SendMessageDto, _$identity);

  /// Serializes this SendMessageDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageDto&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,otherUserId,content);

@override
String toString() {
  return 'SendMessageDto(chatId: $chatId, otherUserId: $otherUserId, content: $content)';
}


}

/// @nodoc
abstract mixin class $SendMessageDtoCopyWith<$Res>  {
  factory $SendMessageDtoCopyWith(SendMessageDto value, $Res Function(SendMessageDto) _then) = _$SendMessageDtoCopyWithImpl;
@useResult
$Res call({
 String? chatId, String otherUserId, ChatMessageContentDto content
});


$ChatMessageContentDtoCopyWith<$Res> get content;

}
/// @nodoc
class _$SendMessageDtoCopyWithImpl<$Res>
    implements $SendMessageDtoCopyWith<$Res> {
  _$SendMessageDtoCopyWithImpl(this._self, this._then);

  final SendMessageDto _self;
  final $Res Function(SendMessageDto) _then;

/// Create a copy of SendMessageDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = freezed,Object? otherUserId = null,Object? content = null,}) {
  return _then(_self.copyWith(
chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ChatMessageContentDto,
  ));
}
/// Create a copy of SendMessageDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageContentDtoCopyWith<$Res> get content {
  
  return $ChatMessageContentDtoCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// Adds pattern-matching-related methods to [SendMessageDto].
extension SendMessageDtoPatterns on SendMessageDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageDto value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageDto value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? chatId,  String otherUserId,  ChatMessageContentDto content)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageDto() when $default != null:
return $default(_that.chatId,_that.otherUserId,_that.content);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? chatId,  String otherUserId,  ChatMessageContentDto content)  $default,) {final _that = this;
switch (_that) {
case _SendMessageDto():
return $default(_that.chatId,_that.otherUserId,_that.content);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? chatId,  String otherUserId,  ChatMessageContentDto content)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageDto() when $default != null:
return $default(_that.chatId,_that.otherUserId,_that.content);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessageDto implements SendMessageDto {
  const _SendMessageDto({required this.chatId, required this.otherUserId, required this.content});
  factory _SendMessageDto.fromJson(Map<String, dynamic> json) => _$SendMessageDtoFromJson(json);

@override final  String? chatId;
@override final  String otherUserId;
@override final  ChatMessageContentDto content;

/// Create a copy of SendMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageDtoCopyWith<_SendMessageDto> get copyWith => __$SendMessageDtoCopyWithImpl<_SendMessageDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessageDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageDto&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.otherUserId, otherUserId) || other.otherUserId == otherUserId)&&(identical(other.content, content) || other.content == content));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,otherUserId,content);

@override
String toString() {
  return 'SendMessageDto(chatId: $chatId, otherUserId: $otherUserId, content: $content)';
}


}

/// @nodoc
abstract mixin class _$SendMessageDtoCopyWith<$Res> implements $SendMessageDtoCopyWith<$Res> {
  factory _$SendMessageDtoCopyWith(_SendMessageDto value, $Res Function(_SendMessageDto) _then) = __$SendMessageDtoCopyWithImpl;
@override @useResult
$Res call({
 String? chatId, String otherUserId, ChatMessageContentDto content
});


@override $ChatMessageContentDtoCopyWith<$Res> get content;

}
/// @nodoc
class __$SendMessageDtoCopyWithImpl<$Res>
    implements _$SendMessageDtoCopyWith<$Res> {
  __$SendMessageDtoCopyWithImpl(this._self, this._then);

  final _SendMessageDto _self;
  final $Res Function(_SendMessageDto) _then;

/// Create a copy of SendMessageDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = freezed,Object? otherUserId = null,Object? content = null,}) {
  return _then(_SendMessageDto(
chatId: freezed == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String?,otherUserId: null == otherUserId ? _self.otherUserId : otherUserId // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as ChatMessageContentDto,
  ));
}

/// Create a copy of SendMessageDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageContentDtoCopyWith<$Res> get content {
  
  return $ChatMessageContentDtoCopyWith<$Res>(_self.content, (value) {
    return _then(_self.copyWith(content: value));
  });
}
}


/// @nodoc
mixin _$SendMessageResDto {

 String get chatId; String get messageId;
/// Create a copy of SendMessageResDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageResDtoCopyWith<SendMessageResDto> get copyWith => _$SendMessageResDtoCopyWithImpl<SendMessageResDto>(this as SendMessageResDto, _$identity);

  /// Serializes this SendMessageResDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageResDto&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.messageId, messageId) || other.messageId == messageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,messageId);

@override
String toString() {
  return 'SendMessageResDto(chatId: $chatId, messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $SendMessageResDtoCopyWith<$Res>  {
  factory $SendMessageResDtoCopyWith(SendMessageResDto value, $Res Function(SendMessageResDto) _then) = _$SendMessageResDtoCopyWithImpl;
@useResult
$Res call({
 String chatId, String messageId
});




}
/// @nodoc
class _$SendMessageResDtoCopyWithImpl<$Res>
    implements $SendMessageResDtoCopyWith<$Res> {
  _$SendMessageResDtoCopyWithImpl(this._self, this._then);

  final SendMessageResDto _self;
  final $Res Function(SendMessageResDto) _then;

/// Create a copy of SendMessageResDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatId = null,Object? messageId = null,}) {
  return _then(_self.copyWith(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendMessageResDto].
extension SendMessageResDtoPatterns on SendMessageResDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageResDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageResDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageResDto value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageResDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageResDto value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageResDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String chatId,  String messageId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageResDto() when $default != null:
return $default(_that.chatId,_that.messageId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String chatId,  String messageId)  $default,) {final _that = this;
switch (_that) {
case _SendMessageResDto():
return $default(_that.chatId,_that.messageId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String chatId,  String messageId)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageResDto() when $default != null:
return $default(_that.chatId,_that.messageId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessageResDto implements SendMessageResDto {
  const _SendMessageResDto({required this.chatId, required this.messageId});
  factory _SendMessageResDto.fromJson(Map<String, dynamic> json) => _$SendMessageResDtoFromJson(json);

@override final  String chatId;
@override final  String messageId;

/// Create a copy of SendMessageResDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageResDtoCopyWith<_SendMessageResDto> get copyWith => __$SendMessageResDtoCopyWithImpl<_SendMessageResDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessageResDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageResDto&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.messageId, messageId) || other.messageId == messageId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chatId,messageId);

@override
String toString() {
  return 'SendMessageResDto(chatId: $chatId, messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class _$SendMessageResDtoCopyWith<$Res> implements $SendMessageResDtoCopyWith<$Res> {
  factory _$SendMessageResDtoCopyWith(_SendMessageResDto value, $Res Function(_SendMessageResDto) _then) = __$SendMessageResDtoCopyWithImpl;
@override @useResult
$Res call({
 String chatId, String messageId
});




}
/// @nodoc
class __$SendMessageResDtoCopyWithImpl<$Res>
    implements _$SendMessageResDtoCopyWith<$Res> {
  __$SendMessageResDtoCopyWithImpl(this._self, this._then);

  final _SendMessageResDto _self;
  final $Res Function(_SendMessageResDto) _then;

/// Create a copy of SendMessageResDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatId = null,Object? messageId = null,}) {
  return _then(_SendMessageResDto(
chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as String,messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
