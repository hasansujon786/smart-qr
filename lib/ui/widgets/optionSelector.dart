import 'package:flutter/material.dart';

final _theme = const ColorScheme.light().primary;
const double _rounded = 10;
const double _borderWidth = 1.2;

class OptionSelector extends StatelessWidget {
  final List<String> options;
  final int selectedOptionIndex;
  final Function onTap;

  const OptionSelector({
    Key? key,
    required this.options,
    this.selectedOptionIndex = 0,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(width: _borderWidth, color: _theme),
        borderRadius: BorderRadius.circular(_rounded + _borderWidth),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_rounded),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Expanded(child: Container(color: Colors.pink, child: const Center(child: Text('foo')))),
          children: [
            OptionItem(options[0], 0, selectedIndex: selectedOptionIndex, onTap: onTap),
            Container(width: _borderWidth, color: _theme),
            OptionItem(options[1], 1, selectedIndex: selectedOptionIndex, onTap: onTap),
            Container(width: _borderWidth, color: _theme),
            OptionItem(options[2], 2, selectedIndex: selectedOptionIndex, onTap: onTap),
          ],
        ),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final String title;
  final int index;
  final int selectedIndex;
  final Function onTap;
  const OptionItem(
    this.title,
    this.index, {
    Key? key,
    required this.onTap,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          color: index == selectedIndex ? _theme : Colors.transparent,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: index == selectedIndex ? Colors.white : _theme,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
