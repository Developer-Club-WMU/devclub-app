import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  // widget properties - usage example: widget.title
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // state properties - usage example: _counter
    int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context); // example usage: "theme.colorScheme.primary" (https://docs.flutter.dev/cookbook/design/themes)
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,

        title: Text('Upcoming Event!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Developer Club App!',
            ),
          ],
        ),
      ),
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
            label: 'Project Hub',
          ),
          NavigationDestination(
            icon: Icon(Icons.emoji_events_outlined),
            selectedIcon: Icon(Icons.emoji_events),
            label: 'School',
          ),
        ],
    ));
  }
}
