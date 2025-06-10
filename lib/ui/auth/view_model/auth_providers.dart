import 'package:devclub_app/data/models/member_model.dart';
import 'package:devclub_app/data/repositories/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

@Riverpod(keepAlive: true)
FirebaseAuthenticationRepository authRepository(Ref ref){
  final auth = ref.watch(firebaseAuthProvider);
  return FirebaseAuthenticationRepository(auth);

}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(Ref ref) {
  return FirebaseAuth.instance;

}

@Riverpod(keepAlive: true)
Stream<Member?> authStateChange(Ref ref) {
    final auth = ref.watch(authRepositoryProvider);
    return auth.authStateChanges();
}