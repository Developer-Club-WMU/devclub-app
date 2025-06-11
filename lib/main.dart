// Material Library, Router and Theme
import 'package:devclub_app/route/view_model/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:devclub_app/ui/core/themes/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'firebase_options.dart';

// Main function
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: DevClubApp())
    );
}

// Main App Widget
class DevClubApp extends ConsumerWidget  {
  const DevClubApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Developer Club App',
      theme: AppTheme.light, // form 'theme.dart'
      darkTheme: AppTheme.dark, // from 'theme.dart'
      themeMode: ThemeMode.system, // Use the OS current theme mode
      routerConfig: router,
    );
  }
}