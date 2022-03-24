import 'package:flutter/material.dart';

import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentViewIndex = 2;
  static const List<Widget> _screens = <Widget>[
    HistoryView(),
    // HiveExample(),
    CreateView(),
    ScanView(),
  ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // Tips: To persists screen state use IndexdStack()
  //     body: _screens.elementAt(_currentViewIndex),
  //     bottomNavigationBar: BottomNavBar(
  //       index: _currentViewIndex,
  //       onTap: (index) => setState(() => _currentViewIndex = index),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // Tips: To persists screen state use IndexdStack()
      body: _screens.elementAt(_currentViewIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () {
          setState(() => _currentViewIndex = 2);
        },
        tooltip: 'Scan',
        child: Icon(Icons.qr_code_scanner_outlined, color: _currentViewIndex == 2 ? Colors.white60 : Colors.white),
        elevation: 2.0,
      ),
      bottomNavigationBar: FabBottomAppBar(
        isFocused: _currentViewIndex < 2,
        onTabSelected: (index) => setState(() => _currentViewIndex = index),
        centerItemText: '',
        items: [
          FABBottomAppBarItem(icon: Icons.history_outlined, text: 'History'),
          FABBottomAppBarItem(icon: Icons.qr_code_outlined, text: 'Create'),
        ],
      ),
    );
  }
}
