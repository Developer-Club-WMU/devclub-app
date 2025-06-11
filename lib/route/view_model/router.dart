import 'package:devclub_app/route/view_model/auth_refresh_notifier.dart';
import 'package:devclub_app/ui/auth/view_model/auth_providers.dart';
import 'package:devclub_app/route/view/appview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:devclub_app/route/view_model/routes.dart';
import 'package:devclub_app/ui/auth/view/login_screen.dart';
import 'package:devclub_app/ui/auth/view/signup_screen.dart';
import 'package:devclub_app/ui/event/view/events_screen.dart';
import 'package:devclub_app/ui/event/view/events_list_screen.dart';
import 'package:devclub_app/ui/event/view/event_details_screen.dart';
import 'package:devclub_app/ui/project/view/projects_screen.dart';
import 'package:devclub_app/ui/challenge/view/challenge_screen.dart';
import 'package:devclub_app/ui/resources/view/resources_screen.dart';
import 'package:devclub_app/ui/info/view/info_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final _routerKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final userAsync = ref.watch(authStateChangeProvider);

  return GoRouter(
    navigatorKey: _routerKey,
    initialLocation: AppRoutes.event.path,
    refreshListenable: AuthRefreshNotifier(ref),
    redirect: (context, state) {

      
      final user = userAsync.asData?.value;
      final loggingIn = state.matchedLocation == AppRoutes.logIn.path || state.matchedLocation == AppRoutes.signUp.path;

      if (user == null && !loggingIn) return AppRoutes.logIn.path;
      if (user != null && loggingIn) return AppRoutes.event.path;

      return null;
    },
    routes: [

      // Login route
      GoRoute(
        path: AppRoutes.logIn.path,
        name: AppRoutes.logIn.name,
        builder: (context, state) => const LoginScreen(),
      ),

      // Signin Route
      GoRoute(
        path: AppRoutes.signUp.path,
        name: AppRoutes.signUp.name,
        builder: (context, state) => const SignUpScreen(),
      ),
    
      // Navigation bar Routes: Each branch represents a tab
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppView(navigationShell: navigationShell);
        },

        branches: [
          
          // Event Main Screen Route
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.event.path,
                name: AppRoutes.event.name,
                builder: (context, state) => const EventsScreen(),
                
                // Each routes represents a sub screens: Events List and Event Details
                routes: [
                  GoRoute(
                    path: AppRoutes.eventsList.path,
                    name: AppRoutes.eventsList.name,
                    builder: (context, state) => const EventsListScreen(),
                  ),
                  GoRoute(
                    path: AppRoutes.eventDetails.path,
                    name: AppRoutes.eventDetails.name,
                    builder: (context, state) => const EventDetailsScreen(),
                  )
                ]
              )
            ]
          ),

          // Project Main Screen Route
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.project.path,
                name: AppRoutes.project.name,
                builder: (context, state) => const ProjectScreen(),
              )
            ]
          ),

          // Challenge Main Screen Route
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.challenge.path,
                name: AppRoutes.challenge.name,
                builder: (context, state) => const ChallengesScreen(),
              )

            ]
          ),

          // Resources Main Screen Route
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.resource.path,
                name: AppRoutes.resource.name,
                builder: (context, state) => const ResourcesScreen(),
              )

            ]
          ),

          // Info Main Screen Route
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.info.path,
                name: AppRoutes.info.name,
                builder: (context, state) => const InfoScreen(),
              )

            ]
          )

        ]
      )
    ]
  );
}