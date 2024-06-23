// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_schedule.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$createScheduleHash() => r'5fb64884a7982f833b2738ab6b80bad13d597d59';

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

/// See also [createSchedule].
@ProviderFor(createSchedule)
const createScheduleProvider = CreateScheduleFamily();

/// See also [createSchedule].
class CreateScheduleFamily extends Family<AsyncValue<void>> {
  /// See also [createSchedule].
  const CreateScheduleFamily();

  /// See also [createSchedule].
  CreateScheduleProvider call(
    CreateScheduleBody body,
  ) {
    return CreateScheduleProvider(
      body,
    );
  }

  @override
  CreateScheduleProvider getProviderOverride(
    covariant CreateScheduleProvider provider,
  ) {
    return call(
      provider.body,
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
  String? get name => r'createScheduleProvider';
}

/// See also [createSchedule].
class CreateScheduleProvider extends AutoDisposeFutureProvider<void> {
  /// See also [createSchedule].
  CreateScheduleProvider(
    CreateScheduleBody body,
  ) : this._internal(
          (ref) => createSchedule(
            ref as CreateScheduleRef,
            body,
          ),
          from: createScheduleProvider,
          name: r'createScheduleProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$createScheduleHash,
          dependencies: CreateScheduleFamily._dependencies,
          allTransitiveDependencies:
              CreateScheduleFamily._allTransitiveDependencies,
          body: body,
        );

  CreateScheduleProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
  }) : super.internal();

  final CreateScheduleBody body;

  @override
  Override overrideWith(
    FutureOr<void> Function(CreateScheduleRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreateScheduleProvider._internal(
        (ref) => create(ref as CreateScheduleRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _CreateScheduleProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreateScheduleProvider && other.body == body;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreateScheduleRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `body` of this provider.
  CreateScheduleBody get body;
}

class _CreateScheduleProviderElement
    extends AutoDisposeFutureProviderElement<void> with CreateScheduleRef {
  _CreateScheduleProviderElement(super.provider);

  @override
  CreateScheduleBody get body => (origin as CreateScheduleProvider).body;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
