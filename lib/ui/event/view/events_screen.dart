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

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        // Container 1
        SliverToBoxAdapter(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: theme.colorScheme.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Center(child: Text("Page 1")),
                  ElevatedButton(
                    onPressed: () => context.push('/events_list'),
                    child: const Text('Go to Events List'),
                  ),
                ],
              ),
            ),
          ),

        // Container 2
        SliverToBoxAdapter(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              color: theme.colorScheme.secondary,
              child: Center(child: Text("Page 2")),
            ),
          ),

        // Container 3
        SliverToBoxAdapter(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: theme.colorScheme.primary,
            child: Center(child: Text("Page 3")),
          ),
        ),

        // Container 4
        SliverToBoxAdapter(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            color: theme.colorScheme.secondary,
            child: Center(child: Text("Page 4")),
          ),
        ),
      ],
    );
  }
}
