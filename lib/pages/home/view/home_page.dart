import 'package:flutter/material.dart';

import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentViewIndex = 1;
  static const List<Widget> _screens = <Widget>[
    HistoryView(),
    // HiveExample(),
    ScanView(),
    CreateView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tips: To persists screen state use IndexdStack()
      body: _screens.elementAt(_currentViewIndex),
      bottomNavigationBar: BottomNavBar(
        index: _currentViewIndex,
        onTap: (index) => setState(() => _currentViewIndex = index),
      ),
    );
  }
}
