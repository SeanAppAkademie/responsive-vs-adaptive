import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveDesignPage extends StatefulWidget {
  const AdaptiveDesignPage({super.key});

  @override
  State<AdaptiveDesignPage> createState() => _AdaptiveDesignPageState();
}

class _AdaptiveDesignPageState extends State<AdaptiveDesignPage> {
  bool switchValue = false;
  double sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          title: Text('Adaptive Design'),
          centerTitle: false,
          bottom: TabBar(
            indicatorColor: Colors.blue.shade200,
            labelColor: Colors.black,
            tabs: [
              Tab(text: 'LayoutBuilder'),
              Tab(text: 'OrientationBuilder'),
              Tab(text: 'Platform Detection'),
              Tab(text: 'Adaptive Widgets'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: TabBarView(
            children: [
              buildLayoutBuilderDemo(),
              buildOrientationBuilderDemo(),
              buildPlatformDetectionDemo(),
              buildAdaptiveWidgetsDemo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLayoutBuilderDemo() {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return buildMobileLayout();
        } else if (constraints.maxWidth < 900) {
          return buildTabletLayout();
        } else {
          return buildDesktopLayout();
        }
      },
    );
  }

  Widget buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📱 Mobile Layout - unter 600px',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 16),
        Column(
          spacing: 8,
          children: [
            buildDemoCard('Card 1'),
            buildDemoCard('Card 2'),
            buildDemoCard('Card 3'),
          ],
        ),
      ],
    );
  }

  Widget buildTabletLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '📱 Tablet Layout - 600 bis 900px',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 16),
        Row(
          spacing: 8,
          children: [
            Expanded(child: buildDemoCard('Card 1')),
            Expanded(child: buildDemoCard('Card 2')),
          ],
        ),
        SizedBox(height: 8),
        buildDemoCard('Card 3'),
      ],
    );
  }

  Widget buildDesktopLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '💻 Desktop Layout - über 900px',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(height: 16),
        Row(
          spacing: 8,
          children: [
            Expanded(child: buildDemoCard('Card 1')),
            Expanded(child: buildDemoCard('Card 2')),
            Expanded(child: buildDemoCard('Card 3')),
          ],
        ),
      ],
    );
  }

  Widget buildDemoCard(String title) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: Text(title)),
    );
  }

  Widget buildOrientationBuilderDemo() {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return buildPortraitLayout();
        } else {
          return buildLandscapeLayout();
        }
      },
    );
  }

  Widget buildPortraitLayout() {
    return Text('📱 Portrait - Hochformat', style: TextStyle(fontSize: 18));
  }

  Widget buildLandscapeLayout() {
    return Text('📱 Landscape - Querformat', style: TextStyle(fontSize: 18));
  }

  String getPlatformName() {
    if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia';
    } else {
      return 'Unbekannt';
    }
  }

  Widget buildPlatformDetectionDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        Text(
          'Aktuelle Plattform: ${getPlatformName()}',
          style: TextStyle(fontSize: 18),
        ),
        buildPlatformButtonsDemo(),
      ],
    );
  }

  Widget buildPlatformButtonsDemo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Text('Buttons', style: TextStyle(fontSize: 18)),
            MaterialButton(onPressed: () {}, child: Text('Android Style')),
            CupertinoButton(
              color: CupertinoColors.activeBlue,
              onPressed: () {},
              child: Text('iOS Style'),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildAdaptiveWidgetsDemo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 32,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Switch', style: TextStyle(fontSize: 18)),
            Switch.adaptive(
              value: switchValue,
              onChanged: (newValue) {
                setState(() {
                  switchValue = newValue;
                });
              },
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Slider', style: TextStyle(fontSize: 18)),
            Slider.adaptive(
              value: sliderValue,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CircularProgressIndicator', style: TextStyle(fontSize: 18)),
            CircularProgressIndicator.adaptive(),
          ],
        ),
      ],
    );
  }
}
