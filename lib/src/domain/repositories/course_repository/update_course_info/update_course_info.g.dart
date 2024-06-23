// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_course_info.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$updateCourseInfoHash() => r'ee22bd83d22ad83c1d9507b1b4f4e5d7b60b3754';

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

/// See also [updateCourseInfo].
@ProviderFor(updateCourseInfo)
const updateCourseInfoProvider = UpdateCourseInfoFamily();

/// See also [updateCourseInfo].
class UpdateCourseInfoFamily extends Family<AsyncValue<void>> {
  /// See also [updateCourseInfo].
  const UpdateCourseInfoFamily();

  /// See also [updateCourseInfo].
  UpdateCourseInfoProvider call(
    EditCourseDTO editCourse,
  ) {
    return UpdateCourseInfoProvider(
      editCourse,
    );
  }

  @override
  UpdateCourseInfoProvider getProviderOverride(
    covariant UpdateCourseInfoProvider provider,
  ) {
    return call(
      provider.editCourse,
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
  String? get name => r'updateCourseInfoProvider';
}

/// See also [updateCourseInfo].
class UpdateCourseInfoProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateCourseInfo].
  UpdateCourseInfoProvider(
    EditCourseDTO editCourse,
  ) : this._internal(
          (ref) => updateCourseInfo(
            ref as UpdateCourseInfoRef,
            editCourse,
          ),
          from: updateCourseInfoProvider,
          name: r'updateCourseInfoProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCourseInfoHash,
          dependencies: UpdateCourseInfoFamily._dependencies,
          allTransitiveDependencies:
              UpdateCourseInfoFamily._allTransitiveDependencies,
          editCourse: editCourse,
        );

  UpdateCourseInfoProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.editCourse,
  }) : super.internal();

  final EditCourseDTO editCourse;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateCourseInfoRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCourseInfoProvider._internal(
        (ref) => create(ref as UpdateCourseInfoRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        editCourse: editCourse,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateCourseInfoProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCourseInfoProvider && other.editCourse == editCourse;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, editCourse.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCourseInfoRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `editCourse` of this provider.
  EditCourseDTO get editCourse;
}

class _UpdateCourseInfoProviderElement
    extends AutoDisposeFutureProviderElement<void> with UpdateCourseInfoRef {
  _UpdateCourseInfoProviderElement(super.provider);

  @override
  EditCourseDTO get editCourse =>
      (origin as UpdateCourseInfoProvider).editCourse;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
