import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  // widget properties - usage example: widget.title
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {    
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Developer Club App!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'The up coming event is coming Fall 2025...',
            ),
          ],
        ),
      );
  }
}
