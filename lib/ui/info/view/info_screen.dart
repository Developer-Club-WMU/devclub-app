import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  
  // TODO: Temporary list of colors to be used in the grid, remove when actual data is available
  final List<Color> colors = [
    Colors.brown, Colors.yellow, Colors.brown, Colors.yellow,
    Colors.brown, Colors.yellow, Colors.brown, Colors.yellow,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomScrollView(
        slivers: <Widget>[

          // SliverAppBar
          SliverAppBar(
            title: const Text('Info'),
            floating: false,
            pinned: false,
            snap: false,
          ),

          SliverMasonryGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childCount: colors.length,
            itemBuilder: (context, index) {
                return Container(
                  height: 100.0 + (index % 4) * 30,
                  color: colors[index],
                  child: Center(child: Text("Tile $index")),
                );
            },
          )
        ],
      ),
    );
  }
}