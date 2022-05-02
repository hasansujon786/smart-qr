import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class QrActions extends StatelessWidget {
  final List<Widget> children;
  const QrActions(this.children, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  factory QrActions.url(BarcodeUrl barcodeUrl) {
    return QrActions([
      QrActionButton(
        label: 'Share',
        icon: Icons.share,
        onTap: () {
          launch(barcodeUrl.url ?? 'sdf');
        },
      ),
      // QrActionButton(
      //   label: 'Open Link',
      //   icon: Icons.link,
      //   onTap: () {
      //     launch(barcodeUrl.url ?? 'sdf');
      //   },
      // )
    ]);
  }
}

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
