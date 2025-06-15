import 'package:devclub_app/ui/auth/view_model/auth_controller.dart';
import 'package:devclub_app/route/view_model/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';


// TODO: Update design with FlutterFlow and Implement here
/// This is the screen that the user will see when they need to type in their credentials before seeing their data
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  // State properties

  // this store the progress of the loading indicator in side the log in screen state
  // BuildContext? _progressIndicatorContext;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Dispose method to clean up controllers
  @override
  void dispose() {
    
    _emailController.dispose();
    _passwordController.dispose();
    
    // // Close loading dialog when closing page
    // if (_progressIndicatorContext != null && _progressIndicatorContext!.mounted) {
    //   Navigator.of(_progressIndicatorContext!).pop();
    //   _progressIndicatorContext = null;
    // }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    // Listen to the auth controller state changes
    ref.listen(authControllerProvider, (prev, state) async {
      
      // Show circular progress indicator when loading
      if (state.isLoading) {
        // await showDialog(
        //   context: context,
        //   builder: (ctx) {
        //     _progressIndicatorContext = ctx;
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   },
        // );
        return;
      }

      // // Close circular progress indicator after rebuild to guarantee that the context is still valid
      // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //   if (_progressIndicatorContext != null && _progressIndicatorContext!.mounted) {
          
      //     Navigator.of(_progressIndicatorContext!).pop();
      //     _progressIndicatorContext = null;
        
      //   }
      // });

      // If loading state has error, show a snackbar with the error message
      if (state.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Error: ${state.error}'),
          ),
        );
      }

    });

    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 47, 41, 39),
              Color.fromARGB(255, 71, 60, 56),
              Color.fromARGB(255, 79, 75, 93),
            ]
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
        
                // TODO: Add custom logo
        
                // Welcome Text
                Text(
                  'Welcome to Developer Club',
                  style: TextStyle(
        
                    // TODO: Replace with your custom font
                    fontFamily: 'Robotto',
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
        
                SizedBox(height: 12),
        
                // Login Request
                Text(
                  'Please log in to continue!',
                  style: TextStyle(
                    fontFamily: 'Robotto',
                    fontWeight: FontWeight.w100,
                    fontSize: 16,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
        
                SizedBox(height: 12),
        
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Email!',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      color: theme.colorScheme.tertiaryFixedDim,
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
        
                SizedBox(height: 6),
        
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter Your Password!',
                    hintStyle: TextStyle(
                      fontFamily: 'Roboto',
                      color: theme.colorScheme.tertiaryFixedDim,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true, // Hide password input, best practice for security
                ),
        
                SizedBox(height: 26),
        
                // Login Button
                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: SignInButton(
                    Buttons.Email, 
                    onPressed: () async {
                      _logIn();
                    }
                  ),
                ),

                SizedBox(height: 8),

                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: SignInButton(
                    Buttons.Google,
                      
                    onPressed: () {},       
                    ),
                  ),

                const SizedBox(height: 12),

                Center(
                    child: Text(
                      'Forgot Password or Don\'t have an account?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                ),

                const SizedBox(height: 12),
        
                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: MaterialButton(
                    
                    onPressed: () {},

                    color: theme.colorScheme.inversePrimary,

                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Sign In With Magic Link',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
        
                  ),
                ),

                SizedBox(height: 10),
        
                SizedBox(
                  width: double.infinity,
                  height: 49,
                  child: MaterialButton(
                    
                    onPressed: () {
                      context.goNamed(AppRoutes.signUp.name);
                    },

                    color: theme.colorScheme.surface,

                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Register an account',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
        
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Log in helper method calling the auth controller, put at the bottom of page to keep the build method clean
  Future<void> _logIn() async {
    
    final auth = ref.read(authControllerProvider.notifier);
    
    await auth.signInUserWithEmailAndPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

  }
  
}