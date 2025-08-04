import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:responsive_vs_adaptive/adaptive_screen.dart';
import 'package:responsive_vs_adaptive/responsive_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive & Adaptive Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> pages = [ResponsiveDesignPage(), AdaptiveDesignPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentIndex,
            backgroundColor: Colors.grey.shade50,
            indicatorColor: Colors.blue.shade100,
            onDestinationSelected: (newPageIndex) {
              setState(() {
                currentIndex = newPageIndex;
              });
            },
            labelType: NavigationRailLabelType.all,
            destinations: [
              NavigationRailDestination(
                icon: Icon(Symbols.responsive_layout_rounded),
                label: Text('Responsive'),
              ),
              NavigationRailDestination(
                icon: Icon(Symbols.mobile_layout_rounded),
                label: Text('Adaptive'),
              ),
            ],
          ),
          VerticalDivider(thickness: 1, width: 1),
          Expanded(child: pages[currentIndex]),
        ],
      ),
    );
  }
}
