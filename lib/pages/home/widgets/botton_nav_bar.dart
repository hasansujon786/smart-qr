import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({required this.icon, required this.text});
  IconData icon;
  String text;
}

class FabBottomAppBar extends StatefulWidget {
  final ValueChanged<int> onTabSelected;
  final List<FABBottomAppBarItem> items;
  final NotchedShape notchedShape;
  final String centerItemText;
  final bool centerItemOnView;
  final double height;

  final double iconSize;
  final double iconFontSize;

  const FabBottomAppBar({
    Key? key,
    this.height = 60.0,
    this.iconSize = 24.0,
    this.iconFontSize = 12,
    this.notchedShape = const CircularNotchedRectangle(),
    required this.centerItemOnView,
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

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Theme.of(context).bottomNavigationBarTheme.backgroundColor;

    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: (int index) {
          widget.onTabSelected(index);
          setState(() => _selectedIndex = index);
        },
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
      color: backgroundColor,
    );
  }

  Widget _buildMiddleTabItem() {
    final color = Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;

    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: widget.iconSize),
            Text(widget.centerItemText, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({required FABBottomAppBarItem item, required int index, required ValueChanged<int> onPressed}) {
    final navbarTheme = Theme.of(context).bottomNavigationBarTheme;
    Color? itemColor = !widget.centerItemOnView && _selectedIndex == index
        ? navbarTheme.selectedItemColor
        : navbarTheme.unselectedItemColor;

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
                Icon(item.icon, color: itemColor, size: widget.iconSize),
                Text(item.text, style: TextStyle(color: itemColor, fontSize: widget.iconFontSize))
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
