// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achieve_honor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$achieveHonorHash() => r'73a65323a9717047876df4bd3fe8941fa4ebe49f';

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

/// See also [achieveHonor].
@ProviderFor(achieveHonor)
const achieveHonorProvider = AchieveHonorFamily();

/// See also [achieveHonor].
class AchieveHonorFamily extends Family<AsyncValue<dynamic>> {
  /// See also [achieveHonor].
  const AchieveHonorFamily();

  /// See also [achieveHonor].
  AchieveHonorProvider call(
    HONOR honor,
  ) {
    return AchieveHonorProvider(
      honor,
    );
  }

  @override
  AchieveHonorProvider getProviderOverride(
    covariant AchieveHonorProvider provider,
  ) {
    return call(
      provider.honor,
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
  String? get name => r'achieveHonorProvider';
}

/// See also [achieveHonor].
class AchieveHonorProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [achieveHonor].
  AchieveHonorProvider(
    HONOR honor,
  ) : this._internal(
          (ref) => achieveHonor(
            ref as AchieveHonorRef,
            honor,
          ),
          from: achieveHonorProvider,
          name: r'achieveHonorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$achieveHonorHash,
          dependencies: AchieveHonorFamily._dependencies,
          allTransitiveDependencies:
              AchieveHonorFamily._allTransitiveDependencies,
          honor: honor,
        );

  AchieveHonorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.honor,
  }) : super.internal();

  final HONOR honor;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(AchieveHonorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AchieveHonorProvider._internal(
        (ref) => create(ref as AchieveHonorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        honor: honor,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _AchieveHonorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AchieveHonorProvider && other.honor == honor;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, honor.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AchieveHonorRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `honor` of this provider.
  HONOR get honor;
}

class _AchieveHonorProviderElement
    extends AutoDisposeFutureProviderElement<dynamic> with AchieveHonorRef {
  _AchieveHonorProviderElement(super.provider);

  @override
  HONOR get honor => (origin as AchieveHonorProvider).honor;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
