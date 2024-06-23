// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_info.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateUserInfoHash() => r'6c5c8f818e50b80ea658015020f113f446e25469';

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

/// See also [updateUserInfo].
@ProviderFor(updateUserInfo)
const updateUserInfoProvider = UpdateUserInfoFamily();

/// See also [updateUserInfo].
class UpdateUserInfoFamily extends Family<AsyncValue<void>> {
  /// See also [updateUserInfo].
  const UpdateUserInfoFamily();

  /// See also [updateUserInfo].
  UpdateUserInfoProvider call(
    UpdateUserInfoDTO updateUser,
  ) {
    return UpdateUserInfoProvider(
      updateUser,
    );
  }

  @override
  UpdateUserInfoProvider getProviderOverride(
    covariant UpdateUserInfoProvider provider,
  ) {
    return call(
      provider.updateUser,
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
  String? get name => r'updateUserInfoProvider';
}

/// See also [updateUserInfo].
class UpdateUserInfoProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateUserInfo].
  UpdateUserInfoProvider(
    UpdateUserInfoDTO updateUser,
  ) : this._internal(
          (ref) => updateUserInfo(
            ref as UpdateUserInfoRef,
            updateUser,
          ),
          from: updateUserInfoProvider,
          name: r'updateUserInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateUserInfoHash,
          dependencies: UpdateUserInfoFamily._dependencies,
          allTransitiveDependencies:
              UpdateUserInfoFamily._allTransitiveDependencies,
          updateUser: updateUser,
        );

  UpdateUserInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.updateUser,
  }) : super.internal();

  final UpdateUserInfoDTO updateUser;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateUserInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateUserInfoProvider._internal(
        (ref) => create(ref as UpdateUserInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        updateUser: updateUser,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateUserInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateUserInfoProvider && other.updateUser == updateUser;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, updateUser.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateUserInfoRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `updateUser` of this provider.
  UpdateUserInfoDTO get updateUser;
}

class _UpdateUserInfoProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateUserInfoRef {
  _UpdateUserInfoProviderElement(super.provider);

  @override
  UpdateUserInfoDTO get updateUser =>
      (origin as UpdateUserInfoProvider).updateUser;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
