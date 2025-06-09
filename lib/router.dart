import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:devclub_app/ui/event/view/events_screen.dart';
import 'package:devclub_app/ui/project/view/projects_screen.dart';
import 'package:devclub_app/ui/challenge/view/challenge_screen.dart';
import 'package:devclub_app/ui/resources/view/resources_screen.dart';
import 'package:devclub_app/ui/info/view/info_screen.dart';

final _routerKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.events,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScaffold(navigationShell: navigationShell);
      },

      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.events,
              builder: (context, state) => const EventsScreen(),
            )
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.projects,
              builder: (context, state) => const ProjectScreen(),
            )
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.challenges,
              builder: (context, state) => const ChallengesScreen(),
            )
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.resources,
              builder: (context, state) => const ResourcesScreen(),
            )
          ]
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.info,
              builder: (context, state) => const InfoScreen(),
            )
          ]
        )
      ]
    )
  ]
);

class AppRoutes {
  AppRoutes._();

  static const String events = '/';
  static const String projects = '/projects';
  static const String challenges = '/challenges';
  static const String resources = '/resources';
  static const String info = '/info';
}

class MainScaffold extends StatefulWidget {
  
  final StatefulNavigationShell navigationShell;

  // constructors
  const MainScaffold({super.key, required this.navigationShell});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();

}

/// This widget serves as the main scaffold for the app, containing the navigation bar and the body which select which page 
/// To navigate from page to subpage we will instead use Navigation Stack.
class _MainScaffoldState extends State<MainScaffold> {

  @override
  Widget build(BuildContext context) {
    
    // build method variables
    final theme = Theme.of(context); // example usage: "theme.colorScheme.primary" (https://docs.flutter.dev/cookbook/design/themes)
    NavigationDestinationLabelBehavior labelBehavior = NavigationDestinationLabelBehavior.onlyShowSelected;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        title: const Text("Developer Club App"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {}
          )]
      ),
      body: widget.navigationShell,
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: widget.navigationShell.currentIndex,
        onDestinationSelected: widget.navigationShell.goBranch,
        indicatorColor: theme.colorScheme.primary,
        destinations: [
          
          NavigationDestination(
            icon: Icon(
              Icons.event_outlined,
              color: widget.navigationShell.currentIndex == 0
                ? theme.colorScheme.primary
                : theme.colorScheme.tertiary,
              ),
            selectedIcon: Icon(Icons.event),
            label: 'Events',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.ballot_outlined,
              color: widget.navigationShell.currentIndex == 1
                  ? theme.colorScheme.primary
                  : theme.colorScheme.tertiary,
            ),
            selectedIcon: Icon(Icons.ballot),
            label: 'Projects Hub',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.emoji_events_outlined,
              color: widget.navigationShell.currentIndex == 2
                  ? theme.colorScheme.primary
                  : theme.colorScheme.tertiary,
            ),
            selectedIcon: Icon(Icons.emoji_events),
            label: 'Challenge',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.dynamic_form_outlined,
              color: widget.navigationShell.currentIndex == 3
                  ? theme.colorScheme.primary
                  : theme.colorScheme.tertiary,
            ),
            selectedIcon: Icon(Icons.dynamic_form),
            label: 'Resources',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.info_outline,
              color: widget.navigationShell.currentIndex == 4
                  ? theme.colorScheme.primary
                  : theme.colorScheme.tertiary,
            ),
            selectedIcon: Icon(Icons.info),
            label: 'Info',
          ),

        ],
    )
    );
  }
}