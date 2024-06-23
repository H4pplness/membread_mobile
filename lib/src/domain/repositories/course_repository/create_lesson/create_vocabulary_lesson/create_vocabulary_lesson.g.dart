// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_vocabulary_lesson.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createVocabularyLessonHash() =>
    r'5a7a1a8f0d6120b31766a3083208cade22ff8a21';

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

/// See also [createVocabularyLesson].
@ProviderFor(createVocabularyLesson)
const createVocabularyLessonProvider = CreateVocabularyLessonFamily();

/// See also [createVocabularyLesson].
class CreateVocabularyLessonFamily extends Family<AsyncValue<bool>> {
  /// See also [createVocabularyLesson].
  const CreateVocabularyLessonFamily();

  /// See also [createVocabularyLesson].
  CreateVocabularyLessonProvider call(
    CreateVocabularyLessonDTO vocabularyLesson,
  ) {
    return CreateVocabularyLessonProvider(
      vocabularyLesson,
    );
  }

  @override
  CreateVocabularyLessonProvider getProviderOverride(
    covariant CreateVocabularyLessonProvider provider,
  ) {
    return call(
      provider.vocabularyLesson,
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
  String? get name => r'createVocabularyLessonProvider';
}

/// See also [createVocabularyLesson].
class CreateVocabularyLessonProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [createVocabularyLesson].
  CreateVocabularyLessonProvider(
    CreateVocabularyLessonDTO vocabularyLesson,
  ) : this._internal(
          (ref) => createVocabularyLesson(
            ref as CreateVocabularyLessonRef,
            vocabularyLesson,
          ),
          from: createVocabularyLessonProvider,
          name: r'createVocabularyLessonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createVocabularyLessonHash,
          dependencies: CreateVocabularyLessonFamily._dependencies,
          allTransitiveDependencies:
              CreateVocabularyLessonFamily._allTransitiveDependencies,
          vocabularyLesson: vocabularyLesson,
        );

  CreateVocabularyLessonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.vocabularyLesson,
  }) : super.internal();

  final CreateVocabularyLessonDTO vocabularyLesson;

  @override
  Override overrideWith(
    FutureOr<bool> Function(CreateVocabularyLessonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateVocabularyLessonProvider._internal(
        (ref) => create(ref as CreateVocabularyLessonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        vocabularyLesson: vocabularyLesson,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _CreateVocabularyLessonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateVocabularyLessonProvider &&
        other.vocabularyLesson == vocabularyLesson;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, vocabularyLesson.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateVocabularyLessonRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `vocabularyLesson` of this provider.
  CreateVocabularyLessonDTO get vocabularyLesson;
}

class _CreateVocabularyLessonProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with CreateVocabularyLessonRef {
  _CreateVocabularyLessonProviderElement(super.provider);

  @override
  CreateVocabularyLessonDTO get vocabularyLesson =>
      (origin as CreateVocabularyLessonProvider).vocabularyLesson;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
