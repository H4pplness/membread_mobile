// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_course_info.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCourseInfoHash() => r'dd73780614aa4ce1ce9675c63bf8709ab191ecb7';

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

/// See also [getCourseInfo].
@ProviderFor(getCourseInfo)
const getCourseInfoProvider = GetCourseInfoFamily();

/// See also [getCourseInfo].
class GetCourseInfoFamily extends Family<AsyncValue<Course>> {
  /// See also [getCourseInfo].
  const GetCourseInfoFamily();

  /// See also [getCourseInfo].
  GetCourseInfoProvider call(
    GetCourseInfoParams getCourseInfoParams,
  ) {
    return GetCourseInfoProvider(
      getCourseInfoParams,
    );
  }

  @override
  GetCourseInfoProvider getProviderOverride(
    covariant GetCourseInfoProvider provider,
  ) {
    return call(
      provider.getCourseInfoParams,
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
  String? get name => r'getCourseInfoProvider';
}

/// See also [getCourseInfo].
class GetCourseInfoProvider extends AutoDisposeFutureProvider<Course> {
  /// See also [getCourseInfo].
  GetCourseInfoProvider(
    GetCourseInfoParams getCourseInfoParams,
  ) : this._internal(
          (ref) => getCourseInfo(
            ref as GetCourseInfoRef,
            getCourseInfoParams,
          ),
          from: getCourseInfoProvider,
          name: r'getCourseInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCourseInfoHash,
          dependencies: GetCourseInfoFamily._dependencies,
          allTransitiveDependencies:
              GetCourseInfoFamily._allTransitiveDependencies,
          getCourseInfoParams: getCourseInfoParams,
        );

  GetCourseInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.getCourseInfoParams,
  }) : super.internal();

  final GetCourseInfoParams getCourseInfoParams;

  @override
  Override overrideWith(
    FutureOr<Course> Function(GetCourseInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCourseInfoProvider._internal(
        (ref) => create(ref as GetCourseInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        getCourseInfoParams: getCourseInfoParams,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Course> createElement() {
    return _GetCourseInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCourseInfoProvider &&
        other.getCourseInfoParams == getCourseInfoParams;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, getCourseInfoParams.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetCourseInfoRef on AutoDisposeFutureProviderRef<Course> {
  /// The parameter `getCourseInfoParams` of this provider.
  GetCourseInfoParams get getCourseInfoParams;
}

class _GetCourseInfoProviderElement
    extends AutoDisposeFutureProviderElement<Course> with GetCourseInfoRef {
  _GetCourseInfoProviderElement(super.provider);

  @override
  GetCourseInfoParams get getCourseInfoParams =>
      (origin as GetCourseInfoProvider).getCourseInfoParams;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
