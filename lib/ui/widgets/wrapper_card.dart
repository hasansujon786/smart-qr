import 'package:flutter/material.dart';

import '../../config/config.dart';

class WrapperCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double blurRadius;
  const WrapperCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(8.0),
    this.blurRadius = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Constants.borderRadius;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: blurRadius)],
      ),
      padding: padding,
      child: child,
    );
  }
}
