import 'package:devclub_app/domain/models/member_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService{
  // Constructor
  FirebaseAuthService(this._firebaseAuth);
  
  final FirebaseAuth _firebaseAuth;

  /// This function gets the current user
  Member? get currentUser => _convertUser(_firebaseAuth.currentUser);

  /// This function takes a firebase user and converts it to our Member model if the passed in user is not null
  Member? _convertUser(User? user) => user == null ? null : Member.fromUser(user);

  /// This function allows the app to listen to the user state change
  Stream<Member?> authStateChanges() {
    return _firebaseAuth.authStateChanges().map(_convertUser);
  }

  /// This function allows the member to sign in with email and password
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
    );
  }

  /// This function allows the member to cre
  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
      return _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
      );
  }

  /// This function allows the member to sign out
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  // TODO: Add function to signin with Google

  // TODO: Add function to do forget password and one time password
}