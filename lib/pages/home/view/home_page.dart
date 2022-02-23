import 'package:flutter/material.dart';

import './view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentViewIndex = 0;
  static const List<Widget> _screens = <Widget>[
    ScanView(),
    CreateView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tips: To persists screen state use IndexdStack()
      body: _screens.elementAt(_currentViewIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentViewIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 12,
        unselectedFontSize: 12,
        /* selectedIconTheme: const IconThemeData(size: 24), */
        /* iconSize: 20, */
        type: BottomNavigationBarType.fixed,
        /* backgroundColor: Theme.of(context).primaryColor, */
        onTap: (int index) => setState(() => _currentViewIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner_outlined),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_outlined),
            label: 'Create',
          ),
        ],
      ),
    );
  }
}
