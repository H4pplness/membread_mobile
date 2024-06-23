// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_lesson.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getLessonHash() => r'6b9e793fab7e394b7e747414aa72dcf5a6890772';

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

/// See also [getLesson].
@ProviderFor(getLesson)
const getLessonProvider = GetLessonFamily();

/// See also [getLesson].
class GetLessonFamily extends Family<AsyncValue<Lesson>> {
  /// See also [getLesson].
  const GetLessonFamily();

  /// See also [getLesson].
  GetLessonProvider call(
    int lessonId,
  ) {
    return GetLessonProvider(
      lessonId,
    );
  }

  @override
  GetLessonProvider getProviderOverride(
    covariant GetLessonProvider provider,
  ) {
    return call(
      provider.lessonId,
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
  String? get name => r'getLessonProvider';
}

/// See also [getLesson].
class GetLessonProvider extends AutoDisposeFutureProvider<Lesson> {
  /// See also [getLesson].
  GetLessonProvider(
    int lessonId,
  ) : this._internal(
          (ref) => getLesson(
            ref as GetLessonRef,
            lessonId,
          ),
          from: getLessonProvider,
          name: r'getLessonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLessonHash,
          dependencies: GetLessonFamily._dependencies,
          allTransitiveDependencies: GetLessonFamily._allTransitiveDependencies,
          lessonId: lessonId,
        );

  GetLessonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.lessonId,
  }) : super.internal();

  final int lessonId;

  @override
  Override overrideWith(
    FutureOr<Lesson> Function(GetLessonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLessonProvider._internal(
        (ref) => create(ref as GetLessonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        lessonId: lessonId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Lesson> createElement() {
    return _GetLessonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLessonProvider && other.lessonId == lessonId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, lessonId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetLessonRef on AutoDisposeFutureProviderRef<Lesson> {
  /// The parameter `lessonId` of this provider.
  int get lessonId;
}

class _GetLessonProviderElement extends AutoDisposeFutureProviderElement<Lesson>
    with GetLessonRef {
  _GetLessonProviderElement(super.provider);

  @override
  int get lessonId => (origin as GetLessonProvider).lessonId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
