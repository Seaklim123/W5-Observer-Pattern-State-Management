import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w5_observer_state/main.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: MyApp(),
    ),
  );
}

class ColorCounters extends ChangeNotifier {
  int _redTapsCount = 0;
  int _blueTapsCount = 0;
  int get redTapsCount => _redTapsCount;
  int get blueTapsCount => _blueTapsCount;

  void incrementRed() {
    _redTapsCount++;
    print("Red tapped: $redTapsCount");
    notifyListeners();
  }

  void incrementBlue() {
    _blueTapsCount++;
    print("Red tapped: $redTapsCount");
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("Home rebuilt");
    return Scaffold(
      body: _currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("ColorTapsScreen rebuilt");
    return Scaffold(
      appBar: AppBar(title: Text("Color Taps")),
      body: Column(
        children: [
          Consumer<ColorCounters>(
            builder:
                (context, counters, child) => ColorTap(
                  color: Colors.red,
                  tapCount: counters.redTapsCount,
                  onTap: counters.incrementRed,
                ),
          ),
          Consumer<ColorCounters>(
            builder:
                (context, counters, child) => ColorTap(
                  color: Colors.blue,
                  tapCount: counters.blueTapsCount,
                  onTap: counters.incrementBlue,
                ),
          ),
        ],
      ),
    );
  }
}


class ColorTap extends StatelessWidget {
  final Color color;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.color,
    required this.tapCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: Consumer<ColorCounters>(
          builder: (context, counters, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Red Taps: ${counters.redTapsCount}', style: TextStyle(fontSize: 24)),
            Text('Blue Taps: ${counters.blueTapsCount}', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
      ),
    );
  }
}
