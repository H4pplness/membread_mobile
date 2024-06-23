// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_course.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createCourseHash() => r'b18688c10d8aeded7a1053d1478110bd39c71b27';

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

/// See also [createCourse].
@ProviderFor(createCourse)
const createCourseProvider = CreateCourseFamily();

/// See also [createCourse].
class CreateCourseFamily extends Family<AsyncValue<void>> {
  /// See also [createCourse].
  const CreateCourseFamily();

  /// See also [createCourse].
  CreateCourseProvider call(
    CreateCourseDTO createCourseDTO,
  ) {
    return CreateCourseProvider(
      createCourseDTO,
    );
  }

  @override
  CreateCourseProvider getProviderOverride(
    covariant CreateCourseProvider provider,
  ) {
    return call(
      provider.createCourseDTO,
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
  String? get name => r'createCourseProvider';
}

/// See also [createCourse].
class CreateCourseProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createCourse].
  CreateCourseProvider(
    CreateCourseDTO createCourseDTO,
  ) : this._internal(
          (ref) => createCourse(
            ref as CreateCourseRef,
            createCourseDTO,
          ),
          from: createCourseProvider,
          name: r'createCourseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createCourseHash,
          dependencies: CreateCourseFamily._dependencies,
          allTransitiveDependencies:
              CreateCourseFamily._allTransitiveDependencies,
          createCourseDTO: createCourseDTO,
        );

  CreateCourseProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.createCourseDTO,
  }) : super.internal();

  final CreateCourseDTO createCourseDTO;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateCourseRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateCourseProvider._internal(
        (ref) => create(ref as CreateCourseRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        createCourseDTO: createCourseDTO,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateCourseProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateCourseProvider &&
        other.createCourseDTO == createCourseDTO;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, createCourseDTO.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateCourseRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `createCourseDTO` of this provider.
  CreateCourseDTO get createCourseDTO;
}

class _CreateCourseProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateCourseRef {
  _CreateCourseProviderElement(super.provider);

  @override
  CreateCourseDTO get createCourseDTO =>
      (origin as CreateCourseProvider).createCourseDTO;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
