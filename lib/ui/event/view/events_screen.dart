import 'package:devclub_app/ui/auth/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
class EventsScreen extends ConsumerStatefulWidget {
  
  // widget properties - usage example: widget.title
  const EventsScreen({super.key});

  @override
  ConsumerState<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  @override
  Widget build(BuildContext context) {

    // build method variables
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    // Apply gradient background with colors fetch from FlutterFlow
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 47, 41, 39),
            Color.fromARGB(255, 71, 60, 56),
            Color.fromARGB(255, 79, 75, 93),
          ]
        ),
      ),
      // Use CustomScrollView to create a scrollable layout with slivers, potentially adding appbar
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          
          // Upcoming Workshop Section
          // TODO: Replace with actual workshop data and UI
          SliverToBoxAdapter(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Center(child: Text("Upcoming Workshop")),
      
                    ElevatedButton(
                      onPressed: () => context.push('/events_list'),
                      child: const Text('Go to Events List'),
                    ),
      
                    // TODO: Design where the sign up button will be and get rid of this button
                    ElevatedButton(
                      onPressed: () async {
                        await ref.read(authControllerProvider.notifier).signOut();
                      },
                      child: const Text('Sign Out'),
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
                child: Center(child: Text("Upcoming Speaker Event")),
              ),
            ),
      
          // Upcoming Hackathon Section
          // TODO: Replace with actual hackathon data and UI
          SliverToBoxAdapter(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              child: Center(child: Text("Upcoming Hackathon")),
            ),
          ),
      
          // Upcoming Community Meeting Section
          // TODO: Replace with actual community meeting data and UI
          SliverToBoxAdapter(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              child: Center(child: Text("Upcoming Community Meeting")),
            ),
          ),
        ],
      ),
    );
  }
}
