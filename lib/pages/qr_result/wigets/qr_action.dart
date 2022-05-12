import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../ui/ui.dart';

class QrAction extends StatelessWidget {
  final Widget mainAction;
  const QrAction(this.mainAction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return mainAction;
  }

  factory QrAction.url(BarcodeUrl barcodeUrl) {
    return QrAction(
      FatButton(
        icon: Icons.mouse_outlined,
        text: 'Open in Browser',
        onPressed: () => launch(barcodeUrl.url ?? ''),
      ),
    );
  }
}

// QrActionButton(
//   label: 'Open Link',
//   icon: Icons.link,
//   onTap: () {
//     launch(barcodeUrl.url ?? 'sdf');
//   },
// )

// TODO: delete this
class QrActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final IconData icon;
  const QrActionButton({
    Key? key,
    required this.onTap,
    required this.label,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 10)),
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ),
      ),
      label: Text(label),
      icon: Icon(icon),
      onPressed: onTap,
    );
  }
}
