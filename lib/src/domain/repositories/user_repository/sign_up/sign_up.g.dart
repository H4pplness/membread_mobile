// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$signUpHash() => r'fffbb19b85224ab4c4908337dcae3ba13223a407';

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

/// See also [signUp].
@ProviderFor(signUp)
const signUpProvider = SignUpFamily();

/// See also [signUp].
class SignUpFamily extends Family<AsyncValue<dynamic>> {
  /// See also [signUp].
  const SignUpFamily();

  /// See also [signUp].
  SignUpProvider call(
    SignUpDTO signup,
  ) {
    return SignUpProvider(
      signup,
    );
  }

  @override
  SignUpProvider getProviderOverride(
    covariant SignUpProvider provider,
  ) {
    return call(
      provider.signup,
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
  String? get name => r'signUpProvider';
}

/// See also [signUp].
class SignUpProvider extends AutoDisposeFutureProvider<dynamic> {
  /// See also [signUp].
  SignUpProvider(
    SignUpDTO signup,
  ) : this._internal(
          (ref) => signUp(
            ref as SignUpRef,
            signup,
          ),
          from: signUpProvider,
          name: r'signUpProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$signUpHash,
          dependencies: SignUpFamily._dependencies,
          allTransitiveDependencies: SignUpFamily._allTransitiveDependencies,
          signup: signup,
        );

  SignUpProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.signup,
  }) : super.internal();

  final SignUpDTO signup;

  @override
  Override overrideWith(
    FutureOr<dynamic> Function(SignUpRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SignUpProvider._internal(
        (ref) => create(ref as SignUpRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        signup: signup,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<dynamic> createElement() {
    return _SignUpProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SignUpProvider && other.signup == signup;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, signup.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SignUpRef on AutoDisposeFutureProviderRef<dynamic> {
  /// The parameter `signup` of this provider.
  SignUpDTO get signup;
}

class _SignUpProviderElement extends AutoDisposeFutureProviderElement<dynamic>
    with SignUpRef {
  _SignUpProviderElement(super.provider);

  @override
  SignUpDTO get signup => (origin as SignUpProvider).signup;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
