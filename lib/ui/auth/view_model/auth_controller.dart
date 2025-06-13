
import 'package:devclub_app/ui/auth/view_model/auth_loading_state.dart';
import 'package:devclub_app/ui/auth/view_model/auth_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

/// This is Notifier: Read https://riverpod.dev/docs/essentials/side_effects to understand more about riverpod notifier generation
@riverpod
class AuthController extends _$AuthController {

    /// This is the method that initializes the state of the controller
    /// 
    /// The current authentication repository doesn’t handle loading states. Managing loading states is essential
    /// because it allows us to display error messages, show users that a process is running in the background,
    /// and prevent multiple sign-in attempts before the current process completes.
    @override
    AuthLoadingState build() {
      return const AuthLoadingState(LoadingStateEnum.initial, null);
    }


    /// This method signs the user in with email and password asynchronously.
    Future<void> signInUserWithEmailAndPassword(String email, String password) async {
      
      state = const AuthLoadingState(LoadingStateEnum.loading, null);
      
      try {

        final authRepository = ref.watch(authRepositoryProvider);
        await authRepository.signInWithEmailAndPassword(email: email, password: password);
        state = const AuthLoadingState(LoadingStateEnum.success, null);
      
      } on Exception catch (e) {

        state = AuthLoadingState(LoadingStateEnum.error, e);

      }
    }

    /// This method creates a user with email and password asynchronously.
    Future<void> createUserWithEmailAndPassword(String email, String password) async {
        
        state = const AuthLoadingState(LoadingStateEnum.loading, null);
        
        try {

          final authRepository = ref.watch(authRepositoryProvider);
          await authRepository.createUserWithEmailAndPassword(email: email, password: password);        
          state = const AuthLoadingState(LoadingStateEnum.success, null);
        
        } on FirebaseAuthException catch (e) {

            state = AuthLoadingState(LoadingStateEnum.error, Exception(_mapFirebaseError(e)));

        } on Exception catch (e) {

            state = AuthLoadingState(LoadingStateEnum.error, e);
        }
    }

    /// This method signs the user out asynchronously.
    Future<void> signOut() async {

        state = const AuthLoadingState(LoadingStateEnum.loading, null);
        final authRepository = ref.watch(authRepositoryProvider);

        try {

          await authRepository.signOut();
          state = const AuthLoadingState(LoadingStateEnum.success, null);

        } on Exception catch (e) {

          state = AuthLoadingState(LoadingStateEnum.error, e);
          print('Error: $e');
        }
    }
    
    // Helper Method for less verbose error message, security best practice
      _mapFirebaseError(FirebaseAuthException e) {
        switch (e.code) {
          case 'user-not-found':
            return "Invalid username or password";
          case 'wrong-password':
            return "Invalid username or password";
          case 'invalid-email':
            return "Please enter a valid email address.";
          case 'network-request-failed':
            return "Network error. Please check your connection.";
          default:
            return "Authentication failed. Please try again.";
        }
      }
}