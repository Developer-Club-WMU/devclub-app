// Material Library and Theme
import 'package:flutter/material.dart';
import 'package:devclub_app/theme.dart';

// Pages
import 'package:devclub_app/home.dart';
import 'package:devclub_app/developer_challenge.dart';
import 'package:devclub_app/projects.dart';
import 'package:devclub_app/resources.dart';
import 'package:devclub_app/info.dart';

// Main function
void main() {
  runApp(const DevClubApp());
}

// Main App Widget
class DevClubApp extends StatelessWidget {
  const DevClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Developer Club App',
      theme: AppTheme.light, // form 'theme.dart'
      darkTheme: AppTheme.dark, // from 'theme.dart'
      themeMode: ThemeMode.system, // Use the OS current theme mode
      home: const MainScaffold(),
    );
  }
}

// Main App Scaffold
// This widget serves as the main scaffold for the app, containing the navigation bar and the body which select which page 
// To navigate from page to subpage we will instead use Navigation Stack.
class MainScaffold extends StatefulWidget {
  
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();

}

class _MainScaffoldState extends State<MainScaffold> {
  
  int currentPageIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    ProjectPage(),
    DeveloperChallengePage(),
    ResourcePage(),
    InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context); // example usage: "theme.colorScheme.primary" (https://docs.flutter.dev/cookbook/design/themes)

    return Scaffold(
      appBar: AppBar(title: const Text("My App")),
      body: pages[currentPageIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: theme.colorScheme.primary,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label: 'Events',
          ),
          NavigationDestination(
            icon: Icon(Icons.ballot_outlined),
            selectedIcon: Icon(Icons.ballot),
            label: 'Projects Hub',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            selectedIcon: Icon(Icons.emoji_events),
            label: 'Developer Challenge',
          ),
           NavigationDestination(
            icon: Icon(Icons.dynamic_form_outlined),
            selectedIcon: Icon(Icons.dynamic_form),
            label: 'Resources',
          ),
            NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
    )
    );
  }
}