import 'package:flutter/material.dart';
import 'package:smart_qr/config/config.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);
  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final seletedColor = Theme.of(context).colorScheme.primary;

    return NavigationBarTheme(
      data: NavigationBarThemeData(
        height: 60,
        iconTheme: MaterialStateProperty.all(IconThemeData(color: Palette.darkerGrey)),
        indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        labelTextStyle: MaterialStateProperty.all(
          TextStyle(fontWeight: FontWeight.w500, fontSize: 11, color: Palette.darkerGrey),
        ),
      ),
      child: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: onTap,
        backgroundColor: Colors.white30,
        destinations: [
          NavigationDestination(
            label: 'History',
            icon: const Icon(Icons.history_outlined),
            selectedIcon: Icon(Icons.history_outlined, color: seletedColor),
          ),
          NavigationDestination(
            label: 'Scan',
            icon: const Icon(Icons.qr_code_scanner_outlined),
            selectedIcon: Icon(Icons.qr_code_scanner_outlined, color: seletedColor),
          ),
          NavigationDestination(
            label: 'Create',
            icon: const Icon(Icons.qr_code_outlined),
            selectedIcon: Icon(Icons.qr_code_outlined, color: seletedColor),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return BottomNavigationBar(
  //     currentIndex: index,
  //     selectedItemColor: Theme.of(context).colorScheme.secondary,
  //     // unselectedItemColor: Colors.grey[500],
  //     selectedFontSize: 12,
  //     unselectedFontSize: 12,
  //     /* selectedIconTheme: const IconThemeData(size: 24), */
  //     /* iconSize: 20, */
  //     type: BottomNavigationBarType.fixed,
  //     /* backgroundColor: Theme.of(context).primaryColor, */
  //     onTap: onTap,
  //     items: const <BottomNavigationBarItem>[
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.qr_code_scanner_outlined),
  //         label: 'Scan',
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.qr_code_outlined),
  //         label: 'Create',
  //       ),
  //     ],
  //   );
  // }
}
