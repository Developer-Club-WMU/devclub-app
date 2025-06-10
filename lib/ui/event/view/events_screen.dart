import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class EventsScreen extends StatefulWidget {

  // widget properties - usage example: widget.title
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Events Page',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
    
        SizedBox(
          height: 10,
        ),
    
        // TODO: Make reuseable widget for this button
        ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
        ),
        onPressed: () {
          context.push('/event_list');
        },
        child: const Text('View Events List'),
      ),
      ],
    );
  }
}
