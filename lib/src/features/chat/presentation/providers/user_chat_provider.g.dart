// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userChatProviderHash() => r'412721b8cf1f998e44d64f0202267b6a9fc20314';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$UserChatProvider
    extends BuildlessAutoDisposeAsyncNotifier<Chat> {
  late final String userId;

  FutureOr<Chat> build(String userId);
}

/// See also [UserChatProvider].
@ProviderFor(UserChatProvider)
const userChatProvider = UserChatProviderFamily();

/// See also [UserChatProvider].
class UserChatProviderFamily extends Family<AsyncValue<Chat>> {
  /// See also [UserChatProvider].
  const UserChatProviderFamily();

  /// See also [UserChatProvider].
  UserChatProviderProvider call(String userId) {
    return UserChatProviderProvider(userId);
  }

  @override
  UserChatProviderProvider getProviderOverride(
    covariant UserChatProviderProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userChatProvider';
}

/// See also [UserChatProvider].
class UserChatProviderProvider
    extends AutoDisposeAsyncNotifierProviderImpl<UserChatProvider, Chat> {
  /// See also [UserChatProvider].
  UserChatProviderProvider(String userId)
    : this._internal(
        () => UserChatProvider()..userId = userId,
        from: userChatProvider,
        name: r'userChatProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userChatProviderHash,
        dependencies: UserChatProviderFamily._dependencies,
        allTransitiveDependencies:
            UserChatProviderFamily._allTransitiveDependencies,
        userId: userId,
      );

  UserChatProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<Chat> runNotifierBuild(covariant UserChatProvider notifier) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(UserChatProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserChatProviderProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<UserChatProvider, Chat>
  createElement() {
    return _UserChatProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserChatProviderProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserChatProviderRef on AutoDisposeAsyncNotifierProviderRef<Chat> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserChatProviderProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<UserChatProvider, Chat>
    with UserChatProviderRef {
  _UserChatProviderProviderElement(super.provider);

  @override
  String get userId => (origin as UserChatProviderProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
