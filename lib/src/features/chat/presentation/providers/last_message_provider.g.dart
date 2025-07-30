// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'last_message_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lastMessageProviderHash() =>
    r'ceeda050e1cc86109663110c518a81023fbf57b6';

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

abstract class _$LastMessageProvider
    extends BuildlessAutoDisposeStreamNotifier<ChatMessage?> {
  late final String chatId;

  Stream<ChatMessage?> build(String chatId);
}

/// See also [LastMessageProvider].
@ProviderFor(LastMessageProvider)
const lastMessageProvider = LastMessageProviderFamily();

/// See also [LastMessageProvider].
class LastMessageProviderFamily extends Family<AsyncValue<ChatMessage?>> {
  /// See also [LastMessageProvider].
  const LastMessageProviderFamily();

  /// See also [LastMessageProvider].
  LastMessageProviderProvider call(String chatId) {
    return LastMessageProviderProvider(chatId);
  }

  @override
  LastMessageProviderProvider getProviderOverride(
    covariant LastMessageProviderProvider provider,
  ) {
    return call(provider.chatId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lastMessageProvider';
}

/// See also [LastMessageProvider].
class LastMessageProviderProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<
          LastMessageProvider,
          ChatMessage?
        > {
  /// See also [LastMessageProvider].
  LastMessageProviderProvider(String chatId)
    : this._internal(
        () => LastMessageProvider()..chatId = chatId,
        from: lastMessageProvider,
        name: r'lastMessageProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$lastMessageProviderHash,
        dependencies: LastMessageProviderFamily._dependencies,
        allTransitiveDependencies:
            LastMessageProviderFamily._allTransitiveDependencies,
        chatId: chatId,
      );

  LastMessageProviderProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
  }) : super.internal();

  final String chatId;

  @override
  Stream<ChatMessage?> runNotifierBuild(
    covariant LastMessageProvider notifier,
  ) {
    return notifier.build(chatId);
  }

  @override
  Override overrideWith(LastMessageProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: LastMessageProviderProvider._internal(
        () => create()..chatId = chatId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<LastMessageProvider, ChatMessage?>
  createElement() {
    return _LastMessageProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastMessageProviderProvider && other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LastMessageProviderRef
    on AutoDisposeStreamNotifierProviderRef<ChatMessage?> {
  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _LastMessageProviderProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          LastMessageProvider,
          ChatMessage?
        >
    with LastMessageProviderRef {
  _LastMessageProviderProviderElement(super.provider);

  @override
  String get chatId => (origin as LastMessageProviderProvider).chatId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
