import 'package:devclub_app/domain/models/member_model.dart';
import 'package:devclub_app/data/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_providers.g.dart';

// Read this to understand this page more if you're new to riverpod provider generation: https://riverpod.dev/docs/essentials/first_request

/// Exposes the FirebaseAuth instance as a Riverpod provider
/// This allows consistent access to FirebaseAuth throughout the app and enables mocking for testing.
@Riverpod(keepAlive: true)
FirebaseAuthService authRepository(Ref ref){
  final auth = ref.watch(firebaseAuthProvider);
  return FirebaseAuthService(auth);
}

/// Provides the FirebaseAuthService, which contains auth-related logic (sign-in, sign-up, etc.).
/// This wraps the FirebaseAuth instance and decouples Firebase logic from higher-level components like controllers.
@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instance;
}

/// Exposes the current authentication state as a stream of Member (nullable).
/// This allows widgets, view models, and the router to react to auth changes (e.g., login, logout).
@Riverpod(keepAlive: true)
Stream<Member?> authStateChange(Ref ref) {
    final auth = ref.watch(authRepositoryProvider);
    return auth.authStateChanges();
}