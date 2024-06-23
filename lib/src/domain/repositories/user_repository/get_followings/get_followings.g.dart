// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_followings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getFollowingsHash() => r'e85880c60780164dc4ba75407d76f4368e515fb1';

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

/// See also [getFollowings].
@ProviderFor(getFollowings)
const getFollowingsProvider = GetFollowingsFamily();

/// See also [getFollowings].
class GetFollowingsFamily extends Family<AsyncValue<List<User>>> {
  /// See also [getFollowings].
  const GetFollowingsFamily();

  /// See also [getFollowings].
  GetFollowingsProvider call(
    String userId,
  ) {
    return GetFollowingsProvider(
      userId,
    );
  }

  @override
  GetFollowingsProvider getProviderOverride(
    covariant GetFollowingsProvider provider,
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
  String? get name => r'getFollowingsProvider';
}

/// See also [getFollowings].
class GetFollowingsProvider extends AutoDisposeFutureProvider<List<User>> {
  /// See also [getFollowings].
  GetFollowingsProvider(
    String userId,
  ) : this._internal(
          (ref) => getFollowings(
            ref as GetFollowingsRef,
            userId,
          ),
          from: getFollowingsProvider,
          name: r'getFollowingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getFollowingsHash,
          dependencies: GetFollowingsFamily._dependencies,
          allTransitiveDependencies:
              GetFollowingsFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetFollowingsProvider._internal(
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
    FutureOr<List<User>> Function(GetFollowingsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetFollowingsProvider._internal(
        (ref) => create(ref as GetFollowingsRef),
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
  AutoDisposeFutureProviderElement<List<User>> createElement() {
    return _GetFollowingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetFollowingsProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetFollowingsRef on AutoDisposeFutureProviderRef<List<User>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetFollowingsProviderElement
    extends AutoDisposeFutureProviderElement<List<User>> with GetFollowingsRef {
  _GetFollowingsProviderElement(super.provider);

  @override
  String get userId => (origin as GetFollowingsProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
