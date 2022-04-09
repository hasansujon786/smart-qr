import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/config.dart';
import '../../../ui/ui.dart';

class CopyButton extends StatelessWidget {
  final String copyText;
  const CopyButton({Key? key, required this.copyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Constants.verticalPadding),
      child: FatButton(
        icon: Icons.copy_rounded,
        text: 'Copy Text',
        onPressed: () {
          Clipboard.setData(ClipboardData(text: copyText)).then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                width: 130,
                content: const SizedBox(height: 22, child: Center(child: Text('Text copied'))),
                duration: const Duration(milliseconds: 1500),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                // backgroundColor: Colors.blue,
              ),
            );
          });
        },
      ),
    );
  }
}
