// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'222fa4d2b5f40f5c9e90c205ccb564533e9e3263';

/// Exposes the FirebaseAuth instance as a Riverpod provider
/// This allows consistent access to FirebaseAuth throughout the app and enables mocking for testing.
///
/// Copied from [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider =
    Provider<FirebaseAuthenticationRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = ProviderRef<FirebaseAuthenticationRepository>;
String _$firebaseAuthHash() => r'cb440927c3ab863427fd4b052a8ccba4c024c863';

/// Provides the FirebaseAuthenticationRepository, which contains auth-related logic (sign-in, sign-up, etc.).
/// This wraps the FirebaseAuth instance and decouples Firebase logic from higher-level components like controllers.
///
/// Copied from [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = Provider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseAuthRef = ProviderRef<FirebaseAuth>;
String _$authStateChangeHash() => r'd0ef62020fa5362bff6c3812062e1c20f77bace2';

/// Exposes the current authentication state as a stream of Member (nullable).
/// This allows widgets, view models, and the router to react to auth changes (e.g., login, logout).
///
/// Copied from [authStateChange].
@ProviderFor(authStateChange)
final authStateChangeProvider = StreamProvider<Member?>.internal(
  authStateChange,
  name: r'authStateChangeProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangeRef = StreamProviderRef<Member?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
