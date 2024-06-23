// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_progress_lesson.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateProgressLessonHash() =>
    r'5d444cbd019a74e4ef1ac8544eae601720d68874';

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

/// See also [updateProgressLesson].
@ProviderFor(updateProgressLesson)
const updateProgressLessonProvider = UpdateProgressLessonFamily();

/// See also [updateProgressLesson].
class UpdateProgressLessonFamily extends Family<AsyncValue<dynamic>> {
  /// See also [updateProgressLesson].
  const UpdateProgressLessonFamily();

  /// See also [updateProgressLesson].
  UpdateProgressLessonProvider call(
    UpdateProgressLessonVocabularyDTO learned,
  ) {
    return UpdateProgressLessonProvider(
      learned,
    );
  }

  @override
  UpdateProgressLessonProvider getProviderOverride(
    covariant UpdateProgressLessonProvider provider,
  ) {
    return call(
      provider.learned,
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
  String? get name => r'updateProgressLessonProvider';
}

/// See also [updateProgressLesson].
class UpdateProgressLessonProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [updateProgressLesson].
  UpdateProgressLessonProvider(
    UpdateProgressLessonVocabularyDTO learned,
  ) : this._internal(
          (ref) => updateProgressLesson(
            ref as UpdateProgressLessonRef,
            learned,
          ),
          from: updateProgressLessonProvider,
          name: r'updateProgressLessonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateProgressLessonHash,
          dependencies: UpdateProgressLessonFamily._dependencies,
          allTransitiveDependencies:
              UpdateProgressLessonFamily._allTransitiveDependencies,
          learned: learned,
        );

  UpdateProgressLessonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.learned,
  }) : super.internal();

  final UpdateProgressLessonVocabularyDTO learned;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(UpdateProgressLessonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateProgressLessonProvider._internal(
        (ref) => create(ref as UpdateProgressLessonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        learned: learned,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _UpdateProgressLessonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateProgressLessonProvider && other.learned == learned;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, learned.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateProgressLessonRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `learned` of this provider.
  UpdateProgressLessonVocabularyDTO get learned;
}

class _UpdateProgressLessonProviderElement
    extends AutoDisposeFutureProviderElement<dynamic>
    with UpdateProgressLessonRef {
  _UpdateProgressLessonProviderElement(super.provider);

  @override
  UpdateProgressLessonVocabularyDTO get learned =>
      (origin as UpdateProgressLessonProvider).learned;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
