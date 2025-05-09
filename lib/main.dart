import 'package:flutter/material.dart';
import 'package:devclub_app/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light, // form 'theme.dart'
      darkTheme: AppTheme.dark, // from 'theme.dart'
      themeMode: ThemeMode.system, // Use the OS current theme mode
      home: const MyHomePage(title: 'Developer Club App'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  // widget properties - usage example: widget.title
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  // state properties - usage example: _counter
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    final theme = Theme.of(context); // example usage: "theme.colorScheme.primary" (https://docs.flutter.dev/cookbook/design/themes)
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Developer Club, now push this button for fun',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
