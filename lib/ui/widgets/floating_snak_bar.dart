import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/config.dart';

class FloatingSnackBar {
  static ScaffoldFeatureController showFloatingSnackBar(context, {required String message, double width = 200}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(0),
        backgroundColor: Colors.transparent,
        width: 250,
        elevation: 0,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Theme.of(context).shadowColor, blurRadius: 2)],
              ),
              height: 42,
              child: Center(
                child: Text(
                  message,
                  style: TextStyle(color: Palette.textDark, fontSize: 12, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

void copyTextWithFeedback(BuildContext context, String text, {message = 'Text Copied..'}) {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    FloatingSnackBar.showFloatingSnackBar(context, message: message, width: 150);
  });
}
