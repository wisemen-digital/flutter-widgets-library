// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'valided_form_text_field.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$showPasswordHash() => r'fa13287d14376c34b3ab33154358acb1039079dd';

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

abstract class _$ShowPassword extends BuildlessAutoDisposeNotifier<bool> {
  late final Key? key;

  bool build({
    Key? key,
  });
}

/// See also [ShowPassword].
@ProviderFor(ShowPassword)
const showPasswordProvider = ShowPasswordFamily();

/// See also [ShowPassword].
class ShowPasswordFamily extends Family<bool> {
  /// See also [ShowPassword].
  const ShowPasswordFamily();

  /// See also [ShowPassword].
  ShowPasswordProvider call({
    Key? key,
  }) {
    return ShowPasswordProvider(
      key: key,
    );
  }

  @override
  ShowPasswordProvider getProviderOverride(
    covariant ShowPasswordProvider provider,
  ) {
    return call(
      key: provider.key,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'showPasswordProvider';
}

/// See also [ShowPassword].
class ShowPasswordProvider
    extends AutoDisposeNotifierProviderImpl<ShowPassword, bool> {
  /// See also [ShowPassword].
  ShowPasswordProvider({
    Key? key,
  }) : this._internal(
          () => ShowPassword()..key = key,
          from: showPasswordProvider,
          name: r'showPasswordProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$showPasswordHash,
          dependencies: ShowPasswordFamily._dependencies,
          allTransitiveDependencies:
              ShowPasswordFamily._allTransitiveDependencies,
          key: key,
        );

  ShowPasswordProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.key,
  }) : super.internal();

  final Key? key;

  @override
  bool runNotifierBuild(
    covariant ShowPassword notifier,
  ) {
    return notifier.build(
      key: key,
    );
  }

  @override
  Override overrideWith(ShowPassword Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShowPasswordProvider._internal(
        () => create()..key = key,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        key: key,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ShowPassword, bool> createElement() {
    return _ShowPasswordProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShowPasswordProvider && other.key == key;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, key.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShowPasswordRef on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `key` of this provider.
  Key? get key;
}

class _ShowPasswordProviderElement
    extends AutoDisposeNotifierProviderElement<ShowPassword, bool>
    with ShowPasswordRef {
  _ShowPasswordProviderElement(super.provider);

  @override
  Key? get key => (origin as ShowPasswordProvider).key;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
