import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


/// This is where the main body of the app, the navbar and redirect to log in lives
class AppView extends ConsumerStatefulWidget {
  
  final StatefulNavigationShell navigationShell;

  // Constructor
  const AppView({super.key, required this.navigationShell});

  @override
  ConsumerState<AppView> createState() => _AppViewState();

}

/// This widget serves as the main scaffold for the app, containing the navigation bar and the body which select which page 
/// To navigate from page to subpage we will instead use Navigation Stack.
class _AppViewState extends ConsumerState<AppView> {

  @override
  Widget build(BuildContext context) {
    
    // build method variables
    final theme = Theme.of(context); // example usage: "theme.colorScheme.primary" (https://docs.flutter.dev/cookbook/design/themes)
    
    return Scaffold(

      body: Stack(
        children: [

          // This is the main body of the app, which will change to the screen selected on the floating nav bar
          widget.navigationShell,
          
          // This is the Floating Navbar that will be at the bottom of all the main screens
          // Positioned the navbar off the bottom and inside the scaffold
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50), // Rounded corners for the navigation bar
              child: Material(
                elevation: 10, // Apply a shadow effect
                color: Colors.white, // TODO: Decide on the background color of the navbar
                child: NavigationBar(
                  labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected, // Show label only when selected
                  selectedIndex: widget.navigationShell.currentIndex,
                  onDestinationSelected: widget.navigationShell.goBranch, 
                  indicatorColor: theme.colorScheme.primary, // Color of the navbar button when an option is selected
                  destinations: [
                    
                    // Events Tab
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
                
                    // Projects Tab
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
                
                    // Challenges Tab
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
                
                    // Resources Tab
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
                
                    // Info Tab
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
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}