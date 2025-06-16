import 'package:devclub_app/domain/models/member_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  /// This functionallows the user to sign in with their google account, 
  Future<UserCredential> signInWithGoogle() async {
  
  // This opens a Google sign-in prompt,
  // if the user chooses an account or logs in, googleUser holds their Google account, if the user cancels, googleUser will be null
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Uses the googleUser from earlier line tofetch the accessToken and idToken needed in the line later
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // This creates a Firebase credential from the tokens we got from Google.
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // This tells firebase that there's a valid Google login, please log in.
  return await _firebaseAuth.signInWithCredential(credential);
}

  // TODO: Add function to sign in with Magic Link
  // Read  to understand more: https://firebase.google.com/docs/auth/flutter/email-link-auth
  final ActionCodeSettings _acs = ActionCodeSettings(
    url: 'http://localhost:50876/completeSignIn', //! TODO: Change this to actual domain when deploy, currently set to localhost for testing
    handleCodeInApp: true,
    iOSBundleId: 'com.example.devclub', // ! TODO: Change this when deploy to Ios
    androidPackageName: 'com.example.devclub', // ! TODO: Change this when deploy to Android
  );

  /// This function allows the member to sign in with email and password
  Future<void> sendSignInLinkToEmail({
    required String email,
  }) {
    return _firebaseAuth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: _acs,
    )

    // TODO: Move this to ViewModel for correct architecture and use try catch for best practice
    .catchError((onError) => print('Error sending email verification $onError'))
    .then((value) => print('Successfully sent email verification'));
  }
  
}
 