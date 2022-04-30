import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.icon, required this.text});
  IconData icon;
  String text;
}

class FabBottomAppBar extends StatefulWidget {
  final List<FABBottomAppBarItem> items;
  final String centerItemText;
  final double height;
  final double iconSize;
  final double iconFontSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape notchedShape;
  final ValueChanged<int> onTabSelected;
  final bool isFocused;

  const FabBottomAppBar({
    Key? key,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.iconFontSize = 12,
    this.backgroundColor = Colors.white,
    this.color = Colors.blueGrey,
    this.selectedColor = Colors.orange,
    this.notchedShape = const CircularNotchedRectangle(),
    required this.isFocused,
    required this.items,
    required this.onTabSelected,
    required this.centerItemText,
  })  : assert(items.length == 2 || items.length == 4),
        super(key: key);

  @override
  _FabBottomAppBarState createState() => _FabBottomAppBarState();
}

class _FabBottomAppBarState extends State<FabBottomAppBar> {
  int _selectedIndex = 0;

  _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });
    items.insert(items.length >> 1, _buildMiddleTabItem());

    return BottomAppBar(
      notchMargin: 6,
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(widget.centerItemText, style: TextStyle(color: widget.color)),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color? color = widget.isFocused && _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.icon, color: color, size: widget.iconSize),
                Text(item.text, style: TextStyle(color: color, fontSize: widget.iconFontSize))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavBarPadding extends StatelessWidget {
  final Widget child;
  const BottomNavBarPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 60),
      child: child,
    );
  }
}

// class BottomNavBar extends StatelessWidget {
//   const BottomNavBar({
//     Key? key,
//     required this.index,
//     required this.onTap,
//   }) : super(key: key);
//   final int index;
//   final Function(int) onTap;

//   @override
//   Widget build(BuildContext context) {
//     final seletedColor = Theme.of(context).colorScheme.primary;

//     return NavigationBarTheme(
//       data: NavigationBarThemeData(
//         height: 60,
//         iconTheme: MaterialStateProperty.all(IconThemeData(color: Palette.darkerGrey)),
//         indicatorColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//         labelTextStyle: MaterialStateProperty.all(
//           TextStyle(fontWeight: FontWeight.w500, fontSize: 11, color: Palette.darkerGrey),
//         ),
//       ),
//       child: NavigationBar(
//         selectedIndex: index,
//         onDestinationSelected: onTap,
//         backgroundColor: Colors.white30,
//         destinations: [
//           NavigationDestination(
//             label: 'History',
//             icon: const Icon(Icons.history_outlined),
//             selectedIcon: Icon(Icons.history_outlined, color: seletedColor),
//           ),
//           NavigationDestination(
//             label: 'Scan',
//             icon: const Icon(Icons.qr_code_scanner_outlined),
//             selectedIcon: Icon(Icons.qr_code_scanner_outlined, color: seletedColor),
//           ),
//           NavigationDestination(
//             label: 'Create',
//             icon: const Icon(Icons.qr_code_outlined),
//             selectedIcon: Icon(Icons.qr_code_outlined, color: seletedColor),
//           ),
//         ],
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return BottomNavigationBar(
//   //     currentIndex: index,
//   //     selectedItemColor: Theme.of(context).colorScheme.secondary,
//   //     // unselectedItemColor: Colors.grey[500],
//   //     selectedFontSize: 12,
//   //     unselectedFontSize: 12,
//   //     /* selectedIconTheme: const IconThemeData(size: 24), */
//   //     /* iconSize: 20, */
//   //     type: BottomNavigationBarType.fixed,
//   //     /* backgroundColor: Theme.of(context).primaryColor, */
//   //     onTap: onTap,
//   //     items: const <BottomNavigationBarItem>[
//   //       BottomNavigationBarItem(
//   //         icon: Icon(Icons.qr_code_scanner_outlined),
//   //         label: 'Scan',
//   //       ),
//   //       BottomNavigationBarItem(
//   //         icon: Icon(Icons.qr_code_outlined),
//   //         label: 'Create',
//   //       ),
//   //     ],
//   //   );
//   // }
// }
