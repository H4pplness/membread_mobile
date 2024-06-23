// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_honor.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getHonorHash() => r'3f35f09743f362881a10ebac1d0e87589328bf6e';

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

/// See also [getHonor].
@ProviderFor(getHonor)
const getHonorProvider = GetHonorFamily();

/// See also [getHonor].
class GetHonorFamily extends Family<AsyncValue<List<HONOR>>> {
  /// See also [getHonor].
  const GetHonorFamily();

  /// See also [getHonor].
  GetHonorProvider call(
    String userId,
  ) {
    return GetHonorProvider(
      userId,
    );
  }

  @override
  GetHonorProvider getProviderOverride(
    covariant GetHonorProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'getHonorProvider';
}

/// See also [getHonor].
class GetHonorProvider extends AutoDisposeFutureProvider<List<HONOR>> {
  /// See also [getHonor].
  GetHonorProvider(
    String userId,
  ) : this._internal(
          (ref) => getHonor(
            ref as GetHonorRef,
            userId,
          ),
          from: getHonorProvider,
          name: r'getHonorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getHonorHash,
          dependencies: GetHonorFamily._dependencies,
          allTransitiveDependencies: GetHonorFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetHonorProvider._internal(
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
  Override overrideWith(
    FutureOr<List<HONOR>> Function(GetHonorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetHonorProvider._internal(
        (ref) => create(ref as GetHonorRef),
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
  AutoDisposeFutureProviderElement<List<HONOR>> createElement() {
    return _GetHonorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetHonorProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetHonorRef on AutoDisposeFutureProviderRef<List<HONOR>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetHonorProviderElement
    extends AutoDisposeFutureProviderElement<List<HONOR>> with GetHonorRef {
  _GetHonorProviderElement(super.provider);

  @override
  String get userId => (origin as GetHonorProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
