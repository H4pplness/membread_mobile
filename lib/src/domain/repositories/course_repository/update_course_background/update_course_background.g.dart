// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_course_background.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateCourseBackgroundHash() =>
    r'2688daad25865d055e57dc593dc8710e793335f5';

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

/// See also [updateCourseBackground].
@ProviderFor(updateCourseBackground)
const updateCourseBackgroundProvider = UpdateCourseBackgroundFamily();

/// See also [updateCourseBackground].
class UpdateCourseBackgroundFamily extends Family<AsyncValue<String?>> {
  /// See also [updateCourseBackground].
  const UpdateCourseBackgroundFamily();

  /// See also [updateCourseBackground].
  UpdateCourseBackgroundProvider call(
    UpdateCourseBackgroundParams params,
  ) {
    return UpdateCourseBackgroundProvider(
      params,
    );
  }

  @override
  UpdateCourseBackgroundProvider getProviderOverride(
    covariant UpdateCourseBackgroundProvider provider,
  ) {
    return call(
      provider.params,
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
  String? get name => r'updateCourseBackgroundProvider';
}

/// See also [updateCourseBackground].
class UpdateCourseBackgroundProvider
    extends AutoDisposeFutureProvider<String?> {
  /// See also [updateCourseBackground].
  UpdateCourseBackgroundProvider(
    UpdateCourseBackgroundParams params,
  ) : this._internal(
          (ref) => updateCourseBackground(
            ref as UpdateCourseBackgroundRef,
            params,
          ),
          from: updateCourseBackgroundProvider,
          name: r'updateCourseBackgroundProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCourseBackgroundHash,
          dependencies: UpdateCourseBackgroundFamily._dependencies,
          allTransitiveDependencies:
              UpdateCourseBackgroundFamily._allTransitiveDependencies,
          params: params,
        );

  UpdateCourseBackgroundProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final UpdateCourseBackgroundParams params;

  @override
  Override overrideWith(
    FutureOr<String?> Function(UpdateCourseBackgroundRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCourseBackgroundProvider._internal(
        (ref) => create(ref as UpdateCourseBackgroundRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        params: params,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String?> createElement() {
    return _UpdateCourseBackgroundProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCourseBackgroundProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCourseBackgroundRef on AutoDisposeFutureProviderRef<String?> {
  /// The parameter `params` of this provider.
  UpdateCourseBackgroundParams get params;
}

class _UpdateCourseBackgroundProviderElement
    extends AutoDisposeFutureProviderElement<String?>
    with UpdateCourseBackgroundRef {
  _UpdateCourseBackgroundProviderElement(super.provider);

  @override
  UpdateCourseBackgroundParams get params =>
      (origin as UpdateCourseBackgroundProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
