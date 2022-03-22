import 'package:flutter/material.dart';
import 'package:smart_qr/config/config.dart';

class WrapperCard extends StatelessWidget {
  final Widget child;
  const WrapperCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Palette.mutedBorder),
        borderRadius: BorderRadius.circular(Constants.rounded),
        color: Colors.white,
      ),
      child: child,
    );
  }
}
