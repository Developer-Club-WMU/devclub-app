import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EventsListScreen extends StatefulWidget {
  const EventsListScreen({super.key});

  @override
  State<EventsListScreen> createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {

  @override
  Widget build(BuildContext context) {

   final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Lists Page'),
        leading: BackButton(
          onPressed: () => context.go('/'),
        ),
        backgroundColor: theme.colorScheme.primary,
      ),

      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Event List Page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                'This is the event list page.',
              ),

              const SizedBox(
                height: 10,
              ),

              ElevatedButton(
                onPressed: () => context.push('/event_details'),
                child: const Text('Event Details'))
            ],
          ),
      ),
      );
  }
}