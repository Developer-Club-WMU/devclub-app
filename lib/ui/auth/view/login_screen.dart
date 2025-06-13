import 'package:devclub_app/ui/auth/view_model/auth_controller.dart';
import 'package:devclub_app/route/view_model/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


// TODO: Update design with FlutterFlow and Implement here
/// This is the screen that the user will see when they need to type in their credentials before seeing their data
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {

  // State properties
  BuildContext? _progressIndicatorContext;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Dispose method to clean up controllers
  @override
  void dispose() {
    
    _emailController.dispose();
    _passwordController.dispose();
    
    // Close loading dialog when closing page
    if (_progressIndicatorContext != null && _progressIndicatorContext!.mounted) {
      Navigator.of(_progressIndicatorContext!).pop();
      _progressIndicatorContext = null;
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    // Listen to the auth controller state changes
    ref.listen(authControllerProvider, (prev, state) async {
      
      // Show circular progress indicator when loading
      if (state.isLoading) {
        await showDialog(
          context: context,
          builder: (ctx) {
            _progressIndicatorContext = ctx;
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
        return;
      }

      // Close circular progress indicator after rebuild to guarantee that the context is still valid
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (_progressIndicatorContext != null && _progressIndicatorContext!.mounted) {
          
          Navigator.of(_progressIndicatorContext!).pop();
          _progressIndicatorContext = null;
        
        }
      });

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
      body: Center(
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
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: theme.colorScheme.primary,
                ),
              ),

              SizedBox(height: 6),

              // Login Request
              Text(
                'Please Log In to continue',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: theme.colorScheme.onSurface,
                ),
              ),

              SizedBox(height: 26),

              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 16),

              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Hide password input, best practice for security
              ),

              SizedBox(height: 26),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  
                  onPressed: _logIn,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),
              ),
              
              SizedBox(height: 26),

              Center(
                  child: GestureDetector(
                    onTap: () {
                      // TODO: Implement Forgot Password OTP
                    },
                    child: Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ),

              SizedBox(height: 10),

              Center(
                child: GestureDetector(
                  onTap: () {
                    context.goNamed(AppRoutes.signUp.name);
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )

            ],
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