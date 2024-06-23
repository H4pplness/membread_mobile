// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_follow.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$checkFollowHash() => r'cd53e8d0023c5a6374043995792cff67c44a27b1';

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

/// See also [checkFollow].
@ProviderFor(checkFollow)
const checkFollowProvider = CheckFollowFamily();

/// See also [checkFollow].
class CheckFollowFamily extends Family<AsyncValue<bool>> {
  /// See also [checkFollow].
  const CheckFollowFamily();

  /// See also [checkFollow].
  CheckFollowProvider call(
    String? userId,
  ) {
    return CheckFollowProvider(
      userId,
    );
  }

  @override
  CheckFollowProvider getProviderOverride(
    covariant CheckFollowProvider provider,
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
  String? get name => r'checkFollowProvider';
}

/// See also [checkFollow].
class CheckFollowProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [checkFollow].
  CheckFollowProvider(
    String? userId,
  ) : this._internal(
          (ref) => checkFollow(
            ref as CheckFollowRef,
            userId,
          ),
          from: checkFollowProvider,
          name: r'checkFollowProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$checkFollowHash,
          dependencies: CheckFollowFamily._dependencies,
          allTransitiveDependencies:
              CheckFollowFamily._allTransitiveDependencies,
          userId: userId,
        );

  CheckFollowProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String? userId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CheckFollowRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CheckFollowProvider._internal(
        (ref) => create(ref as CheckFollowRef),
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
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CheckFollowProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CheckFollowProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CheckFollowRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `userId` of this provider.
  String? get userId;
}

class _CheckFollowProviderElement extends AutoDisposeFutureProviderElement<bool>
    with CheckFollowRef {
  _CheckFollowProviderElement(super.provider);

  @override
  String? get userId => (origin as CheckFollowProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
