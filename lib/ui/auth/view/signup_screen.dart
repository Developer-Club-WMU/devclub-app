import 'package:devclub_app/ui/auth/view_model/auth_controller.dart';
import 'package:devclub_app/route/view_model/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


// TODO: Update design through flutterflow planning and then implement here
/// This is the screen that use be seein when they need to create an account, it's currently a poorly designed one
class SignUpScreen extends ConsumerStatefulWidget  {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {

  // State properties
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Dispose method to clean up controllers
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

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
                'Create an account to continue',
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

              SizedBox(height: 16),

              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),

              SizedBox(height: 26),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 49,
                child: ElevatedButton(
                  
                  onPressed: _signUp,

                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: Text(
                    'Sign Up',
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
                    context.goNamed(AppRoutes.signUp.name);
                  },
                  child: Text(
                    "Already Have an Account? Log In",
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
  Future<void> _signUp() async {
    
    // Match password and confirm password
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (password != confirmPassword) {
      // Show error to user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );

      return;
    }


    final auth = ref.read(authControllerProvider.notifier);
    
    await auth.createUserWithEmailAndPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

  }
  
}