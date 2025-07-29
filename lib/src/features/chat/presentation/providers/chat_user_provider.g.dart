// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatUserProviderHash() => r'8d29ce56cd5fa70097e4d94fa35a25cccb2da4bb';

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

abstract class _$ChatUserProvider
    extends BuildlessAutoDisposeStreamNotifier<ChatUser?> {
  late final String userId;

  Stream<ChatUser?> build(String userId);
}

/// See also [ChatUserProvider].
@ProviderFor(ChatUserProvider)
const chatUserProvider = ChatUserProviderFamily();

/// See also [ChatUserProvider].
class ChatUserProviderFamily extends Family<AsyncValue<ChatUser?>> {
  /// See also [ChatUserProvider].
  const ChatUserProviderFamily();

  /// See also [ChatUserProvider].
  ChatUserProviderProvider call(String userId) {
    return ChatUserProviderProvider(userId);
  }

  @override
  ChatUserProviderProvider getProviderOverride(
    covariant ChatUserProviderProvider provider,
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
  String? get name => r'chatUserProvider';
}

/// See also [ChatUserProvider].
class ChatUserProviderProvider
    extends AutoDisposeStreamNotifierProviderImpl<ChatUserProvider, ChatUser?> {
  /// See also [ChatUserProvider].
  ChatUserProviderProvider(String userId)
    : this._internal(
        () => ChatUserProvider()..userId = userId,
        from: chatUserProvider,
        name: r'chatUserProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$chatUserProviderHash,
        dependencies: ChatUserProviderFamily._dependencies,
        allTransitiveDependencies:
            ChatUserProviderFamily._allTransitiveDependencies,
        userId: userId,
      );

  ChatUserProviderProvider._internal(
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
  Stream<ChatUser?> runNotifierBuild(covariant ChatUserProvider notifier) {
    return notifier.build(userId);
  }

  @override
  Override overrideWith(ChatUserProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: ChatUserProviderProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<ChatUserProvider, ChatUser?>
  createElement() {
    return _ChatUserProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatUserProviderProvider && other.userId == userId;
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
mixin ChatUserProviderRef on AutoDisposeStreamNotifierProviderRef<ChatUser?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _ChatUserProviderProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<ChatUserProvider, ChatUser?>
    with ChatUserProviderRef {
  _ChatUserProviderProviderElement(super.provider);

  @override
  String get userId => (origin as ChatUserProviderProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
