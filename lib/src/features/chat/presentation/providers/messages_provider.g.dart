// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagesProviderHash() => r'49adfed529c2e6f13bdd3883097f0e8c84bd5f3f';

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

abstract class _$MessagesProvider
    extends BuildlessAutoDisposeStreamNotifier<List<ChatMessage>> {
  late final String chatId;

  Stream<List<ChatMessage>> build(String chatId);
}

/// See also [MessagesProvider].
@ProviderFor(MessagesProvider)
const messagesProvider = MessagesProviderFamily();

/// See also [MessagesProvider].
class MessagesProviderFamily extends Family<AsyncValue<List<ChatMessage>>> {
  /// See also [MessagesProvider].
  const MessagesProviderFamily();

  /// See also [MessagesProvider].
  MessagesProviderProvider call(String chatId) {
    return MessagesProviderProvider(chatId);
  }

  @override
  MessagesProviderProvider getProviderOverride(
    covariant MessagesProviderProvider provider,
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
  String? get name => r'messagesProvider';
}

/// See also [MessagesProvider].
class MessagesProviderProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<
          MessagesProvider,
          List<ChatMessage>
        > {
  /// See also [MessagesProvider].
  MessagesProviderProvider(String chatId)
    : this._internal(
        () => MessagesProvider()..chatId = chatId,
        from: messagesProvider,
        name: r'messagesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$messagesProviderHash,
        dependencies: MessagesProviderFamily._dependencies,
        allTransitiveDependencies:
            MessagesProviderFamily._allTransitiveDependencies,
        chatId: chatId,
      );

  MessagesProviderProvider._internal(
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
  Stream<List<ChatMessage>> runNotifierBuild(
    covariant MessagesProvider notifier,
  ) {
    return notifier.build(chatId);
  }

  @override
  Override overrideWith(MessagesProvider Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessagesProviderProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<MessagesProvider, List<ChatMessage>>
  createElement() {
    return _MessagesProviderProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagesProviderProvider && other.chatId == chatId;
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
mixin MessagesProviderRef
    on AutoDisposeStreamNotifierProviderRef<List<ChatMessage>> {
  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _MessagesProviderProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          MessagesProvider,
          List<ChatMessage>
        >
    with MessagesProviderRef {
  _MessagesProviderProviderElement(super.provider);

  @override
  String get chatId => (origin as MessagesProviderProvider).chatId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
