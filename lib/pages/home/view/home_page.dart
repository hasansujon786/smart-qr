import 'package:flutter/material.dart';

import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<Widget> _screens = <Widget>[
    // HiveExample(),
    HistoryView(),
    Favorite(),
    CreateView(),
    Settings(),
    ScanView(),
  ];

  static final int _scanViewIndex = _screens.length - 1;
  int _currentViewIndex = _screens.length - 1;

  @override
  Widget build(BuildContext context) {
    final isCenterItemOnView = _currentViewIndex == _scanViewIndex;

    return Scaffold(
      extendBody: true,
      // Tips: To persists screen state use IndexdStack()
      body: _screens.elementAt(_currentViewIndex),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _currentViewIndex = _scanViewIndex),
        elevation: isCenterItemOnView ? 0 : 5,
        tooltip: 'Scan',
        child: Icon(
          Icons.qr_code_scanner_outlined,
          color: isCenterItemOnView ? Colors.white60 : Colors.white,
        ),
      ),
      bottomNavigationBar: FabBottomAppBar(
        centerItemOnView: isCenterItemOnView,
        onTabSelected: (index) => setState(() => _currentViewIndex = index),
        centerItemText: '',
        iconFontSize: 10,
        items: [
          FABBottomAppBarItem(icon: Icons.history_outlined, text: 'History'),
          FABBottomAppBarItem(icon: Icons.star_border_outlined, text: 'Favorites'),
          FABBottomAppBarItem(icon: Icons.qr_code_outlined, text: 'Create'),
          FABBottomAppBarItem(icon: Icons.settings_outlined, text: 'Settings'),
        ],
      ),
      // bottomNavigationBar: BottomNavBar(
      //   index: _currentViewIndex,
      //   onTap: (index) => setState(() => _currentViewIndex = index),
      // ),
    );
  }
}
