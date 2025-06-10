import 'package:flutter/material.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context);

    return PageView.builder(
      itemCount: 7,
      physics: const ClampingScrollPhysics(),
      controller: PageController(viewportFraction: 1),
      itemBuilder: (context, index) {
        switch(index) {
          case 0:
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: theme.colorScheme.primary,
              child: Center(child: Text("W1 View")),
            );
          case 1:
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: theme.colorScheme.primary,
              child: Center(child: Text("Web Community")),
            );
          case 2:
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: theme.colorScheme.primary,
              child: Center(child: Text("App Community")),
            );
            case 3:
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: theme.colorScheme.primary,
              child: Center(child: Text("AI Community")),
            );
            case 4:
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: theme.colorScheme.primary,
              child: Center(child: Text("Game Community")),
            );
            case 5:
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: theme.colorScheme.primary,
              child: Center(child: Text("System Community")),
            );
            case 6:
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              color: theme.colorScheme.primary,
              child: Center(child: Text("Hackathon Community")),
            );
            default:
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                color: theme.colorScheme.primary,
                child: Center(child: Text("Default View")),
              );
        }
      },
    );
  }
}