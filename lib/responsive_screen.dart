import 'package:flutter/material.dart';

class ResponsiveDesignPage extends StatelessWidget {
  const ResponsiveDesignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          title: Text('Responsive Design Demo'),
          centerTitle: false,
          bottom: TabBar(
            indicatorColor: Colors.blue.shade200,
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'MediaQuery'),
              Tab(text: 'Wrap'),
              Tab(text: 'Expanded & Flexible'),
              Tab(text: 'Spacer'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: TabBarView(
            children: [
              buildMediaQueryDemo(),
              buildWrapDemo(),
              buildExpandedFlexibleDemo(),
              buildSpacerDemo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMediaQueryDemo() {
    return Builder(
      builder: (context) {
        double screenWidth = MediaQuery.sizeOf(context).width;
        double screenHeight = MediaQuery.sizeOf(context).height;

        double halfWidth = screenWidth * 0.5;
        double halfHeight = screenHeight * 0.5;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bildschirmbreite: ${screenWidth.toInt()}px',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '50% der Breite: ${halfWidth.toInt()}px',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            Container(
              width: halfWidth,
              height: halfHeight,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '50% Breite\n50% Höhe',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildWrapDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(12, (index) {
            return Chip(
              label: Text('Item ${index + 1}'),
              backgroundColor: Colors.blue.shade200,
              side: BorderSide.none,
            );
          }),
        ),
      ],
    );
  }

  Widget buildExpandedFlexibleDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 100,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Expanded\n(flex: 2)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Flexible\n(flex: 1)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Expanded\n(flex: 1)',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildSpacerDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          child: Row(
            children: [
              Container(
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.blue.shade500,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text('A')),
              ),
              const Spacer(flex: 2),
              Container(
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text('B')),
              ),
              const Spacer(),
              Container(
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.blue.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(child: Text('C')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
