import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/config.dart';
import '../../../ui/ui.dart';

class CopyButton extends StatelessWidget {
  final String copyText;
  final String rawValue;
  const CopyButton({Key? key, required this.copyText, required this.rawValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Constants.verticalPadding),
      child: FatButton(
        icon: Icons.copy_rounded,
        text: 'Copy Text',
        onLongPress: () {
          print('=============================================');
          print(rawValue);
        },
        onPressed: () {
          Clipboard.setData(ClipboardData(text: copyText)).then((_) {
            FloatingSnackBar.showFloatingSnackBar(context, message: 'Text copied', width: 120);
          });
        },
      ),
    );
  }
}
