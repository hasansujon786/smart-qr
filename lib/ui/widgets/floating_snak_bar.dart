import 'package:flutter/material.dart';
import 'package:smart_qr/config/config.dart';

class FloatingSnackBar {
  static ScaffoldFeatureController showFloatingSnackBar(context, {required String message, double width = 200}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: width,
        backgroundColor: Colors.white,
        content: SizedBox(
          height: 18,
          child: Center(child: Text(message, style: TextStyle(color: Palette.text, fontWeight: FontWeight.w500))),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
          side: const BorderSide(width: 0.8, color: Color(0xffd1d5db)),
        ),
        // backgroundColor: Colors.blue,
      ),
    );
  }
}
