// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_leader_board.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getLeaderBoardHash() => r'c2cbe456510ba20bbc3160bd3c331227d4b486cb';

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

/// See also [getLeaderBoard].
@ProviderFor(getLeaderBoard)
const getLeaderBoardProvider = GetLeaderBoardFamily();

/// See also [getLeaderBoard].
class GetLeaderBoardFamily extends Family<AsyncValue<List<UserScoreDTO>>> {
  /// See also [getLeaderBoard].
  const GetLeaderBoardFamily();

  /// See also [getLeaderBoard].
  GetLeaderBoardProvider call(
    GetLeaderBoardParams params,
  ) {
    return GetLeaderBoardProvider(
      params,
    );
  }

  @override
  GetLeaderBoardProvider getProviderOverride(
    covariant GetLeaderBoardProvider provider,
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
  String? get name => r'getLeaderBoardProvider';
}

/// See also [getLeaderBoard].
class GetLeaderBoardProvider
    extends AutoDisposeFutureProvider<List<UserScoreDTO>> {
  /// See also [getLeaderBoard].
  GetLeaderBoardProvider(
    GetLeaderBoardParams params,
  ) : this._internal(
          (ref) => getLeaderBoard(
            ref as GetLeaderBoardRef,
            params,
          ),
          from: getLeaderBoardProvider,
          name: r'getLeaderBoardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLeaderBoardHash,
          dependencies: GetLeaderBoardFamily._dependencies,
          allTransitiveDependencies:
              GetLeaderBoardFamily._allTransitiveDependencies,
          params: params,
        );

  GetLeaderBoardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.params,
  }) : super.internal();

  final GetLeaderBoardParams params;

  @override
  Override overrideWith(
    FutureOr<List<UserScoreDTO>> Function(GetLeaderBoardRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLeaderBoardProvider._internal(
        (ref) => create(ref as GetLeaderBoardRef),
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
  AutoDisposeFutureProviderElement<List<UserScoreDTO>> createElement() {
    return _GetLeaderBoardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLeaderBoardProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetLeaderBoardRef on AutoDisposeFutureProviderRef<List<UserScoreDTO>> {
  /// The parameter `params` of this provider.
  GetLeaderBoardParams get params;
}

class _GetLeaderBoardProviderElement
    extends AutoDisposeFutureProviderElement<List<UserScoreDTO>>
    with GetLeaderBoardRef {
  _GetLeaderBoardProviderElement(super.provider);

  @override
  GetLeaderBoardParams get params => (origin as GetLeaderBoardProvider).params;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
