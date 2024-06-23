// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_course.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$joinCourseHash() => r'2e696e20a5520afd675480a4326e9567a2b33480';

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

/// See also [joinCourse].
@ProviderFor(joinCourse)
const joinCourseProvider = JoinCourseFamily();

/// See also [joinCourse].
class JoinCourseFamily extends Family<AsyncValue<void>> {
  /// See also [joinCourse].
  const JoinCourseFamily();

  /// See also [joinCourse].
  JoinCourseProvider call(
    int courseId,
  ) {
    return JoinCourseProvider(
      courseId,
    );
  }

  @override
  JoinCourseProvider getProviderOverride(
    covariant JoinCourseProvider provider,
  ) {
    return call(
      provider.courseId,
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
  String? get name => r'joinCourseProvider';
}

/// See also [joinCourse].
class JoinCourseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [joinCourse].
  JoinCourseProvider(
    int courseId,
  ) : this._internal(
          (ref) => joinCourse(
            ref as JoinCourseRef,
            courseId,
          ),
          from: joinCourseProvider,
          name: r'joinCourseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$joinCourseHash,
          dependencies: JoinCourseFamily._dependencies,
          allTransitiveDependencies:
              JoinCourseFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  JoinCourseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
  }) : super.internal();

  final int courseId;

  @override
  Override overrideWith(
    FutureOr<void> Function(JoinCourseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: JoinCourseProvider._internal(
        (ref) => create(ref as JoinCourseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _JoinCourseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is JoinCourseProvider && other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin JoinCourseRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `courseId` of this provider.
  int get courseId;
}

class _JoinCourseProviderElement extends AutoDisposeFutureProviderElement<void>
    with JoinCourseRef {
  _JoinCourseProviderElement(super.provider);

  @override
  int get courseId => (origin as JoinCourseProvider).courseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
