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
      itemCount: 3,
      physics: const ClampingScrollPhysics(),
      controller: PageController(viewportFraction: 1),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          color: theme.colorScheme.primary,
          child: Center(child: Text("Page $index")),
        );
    },
  );

  }
}