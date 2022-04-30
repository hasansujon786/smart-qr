import 'package:flutter/material.dart';

import '../../config/config.dart';

class WrapperCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double blurRadius;
  final Color? color;
  const WrapperCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
    this.blurRadius = 1,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final radius = Constants.borderRadius;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color ?? theme.cardColor,
        boxShadow: [BoxShadow(color: theme.shadowColor, blurRadius: blurRadius)],
      ),
      padding: padding,
      child: child,
    );
  }
}
