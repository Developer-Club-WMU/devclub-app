import 'package:flutter/material.dart';
import 'package:devclub_app/ui/event/view/events_list_screen.dart';

class EventDetailsScreen extends StatefulWidget {

  // widget properties - usage example: widget.title
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  
  @override
  Widget build(BuildContext context) {    
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Developer Club!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'The up coming event is coming Fall 2025...',
            ),

            SizedBox(
              height: 10,
            ),

            // TODO: Make reuseable widget for this button
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              foregroundColor: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalendarPage()),
              );
            },
            child: const Text('Events Details Screen'),
          ),
          ],
        ),
      );
  }
}
