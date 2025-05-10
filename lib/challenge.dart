import 'package:flutter/material.dart';

class DeveloperChallengePage extends StatefulWidget {
  const DeveloperChallengePage({super.key});

  @override
  State<DeveloperChallengePage> createState() => _DeveloperChallengeState();
}

class _DeveloperChallengeState extends State<DeveloperChallengePage> {
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Developer Challenge Page',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Text(
            'This is the developer challenge page.',
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
              // Add your button action here
            },
            child: const Text('Request to take a client\'s request'),
          ),
        ],
      ),
    );
  }
}