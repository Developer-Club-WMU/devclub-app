import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {

  @override
  Widget build(BuildContext context) {

   final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Page'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: theme.colorScheme.primary,
      ),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Calendar Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        
              const Text(
                'This is the calendar page.',
              ),
        
              SizedBox(
                height: 10,
              ),
            ],
          ),
      ),
      );
  }
}