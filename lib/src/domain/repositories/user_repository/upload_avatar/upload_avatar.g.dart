// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_avatar.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$uploadAvatarHash() => r'3063bc64c7fc89fcb82e7724c61f0a4b67322e3a';

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

/// See also [uploadAvatar].
@ProviderFor(uploadAvatar)
const uploadAvatarProvider = UploadAvatarFamily();

/// See also [uploadAvatar].
class UploadAvatarFamily extends Family<AsyncValue<String?>> {
  /// See also [uploadAvatar].
  const UploadAvatarFamily();

  /// See also [uploadAvatar].
  UploadAvatarProvider call(
    XFile? file,
  ) {
    return UploadAvatarProvider(
      file,
    );
  }

  @override
  UploadAvatarProvider getProviderOverride(
    covariant UploadAvatarProvider provider,
  ) {
    return call(
      provider.file,
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
  String? get name => r'uploadAvatarProvider';
}

/// See also [uploadAvatar].
class UploadAvatarProvider extends AutoDisposeFutureProvider<String?> {
  /// See also [uploadAvatar].
  UploadAvatarProvider(
    XFile? file,
  ) : this._internal(
          (ref) => uploadAvatar(
            ref as UploadAvatarRef,
            file,
          ),
          from: uploadAvatarProvider,
          name: r'uploadAvatarProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$uploadAvatarHash,
          dependencies: UploadAvatarFamily._dependencies,
          allTransitiveDependencies:
              UploadAvatarFamily._allTransitiveDependencies,
          file: file,
        );

  UploadAvatarProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.file,
  }) : super.internal();

  final XFile? file;

  @override
  Override overrideWith(
    FutureOr<String?> Function(UploadAvatarRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UploadAvatarProvider._internal(
        (ref) => create(ref as UploadAvatarRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        file: file,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _UploadAvatarProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UploadAvatarProvider && other.file == file;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, file.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UploadAvatarRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `file` of this provider.
  XFile? get file;
}

class _UploadAvatarProviderElement
    extends AutoDisposeFutureProviderElement<String?> with UploadAvatarRef {
  _UploadAvatarProviderElement(super.provider);

  @override
  XFile? get file => (origin as UploadAvatarProvider).file;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
