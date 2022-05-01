import 'package:flutter/material.dart';

import '../../../config/config.dart';

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
    const double borderWidth = 1.2;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(width: borderWidth, color: primaryColor),
        borderRadius: BorderRadius.circular(Constants.inputBorderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Constants.inputBorderRadius - borderWidth),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Expanded(child: Container(color: Colors.pink, child: const Center(child: Text('foo')))),
          children: [
            OptionItem(options[0], 0, selectedIndex: selectedOptionIndex, onTap: onTap),
            Container(width: borderWidth, color: primaryColor),
            OptionItem(options[1], 1, selectedIndex: selectedOptionIndex, onTap: onTap),
            Container(width: borderWidth, color: primaryColor),
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
    final theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          color: index == selectedIndex ? theme.colorScheme.primary : Colors.transparent,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: index == selectedIndex ? theme.colorScheme.onPrimary : theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
