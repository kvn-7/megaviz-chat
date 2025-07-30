import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megaviz_chat/src/features/auth/domain/entities/auth_user.dart';

part 'auth_user_dto.freezed.dart';
part 'auth_user_dto.g.dart';

@freezed
abstract class AuthUserDto with _$AuthUserDto {
  const factory AuthUserDto({
    required String id,
    required String email,
    required String name,
    String? photoUrl,
  }) = _AuthUserDto;

  factory AuthUserDto.fromJson(Map<String, dynamic> json) =>
      _$AuthUserDtoFromJson(json);

  factory AuthUserDto.fromFirebaseUser(User user) {
    return AuthUserDto(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName ?? '',
      photoUrl: user.photoURL,
    );
  }
}

extension AuthUserDtoExtension on AuthUserDto {
  AuthUser toDomain() {
    return AuthUser(id: id, email: email, name: name, photoUrl: photoUrl);
  }
}
