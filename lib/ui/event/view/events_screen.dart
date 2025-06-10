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

    // build method variables
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    // Use CustomScrollView to create a scrollable layout with slivers, potentially adding appbar
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        
        // Upcoming Workshop Section
        // TODO: Replace with actual workshop data and UI
        SliverToBoxAdapter(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: theme.colorScheme.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Center(child: Text("Upcoming Workshop")),
                  ElevatedButton(
                    onPressed: () => context.push('/events_list'),
                    child: const Text('Go to Events List'),
                  ),
                ],
              ),
            ),
          ),

        // Upcoming Speaker Event Section
        // TODO: Replace with actual speaker event data and UI
        SliverToBoxAdapter(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              color: theme.colorScheme.secondary,
              child: Center(child: Text("Upcoming Speaker Event")),
            ),
          ),

        // Upcoming Hackathon Section
        // TODO: Replace with actual hackathon data and UI
        SliverToBoxAdapter(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: theme.colorScheme.primary,
            child: Center(child: Text("Upcoming Hackathon")),
          ),
        ),

        // Upcoming Community Meeting Section
        // TODO: Replace with actual community meeting data and UI
        SliverToBoxAdapter(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: theme.colorScheme.secondary,
            child: Center(child: Text("Upcoming Community Meeting")),
          ),
        ),
      ],
    );
  }
}
