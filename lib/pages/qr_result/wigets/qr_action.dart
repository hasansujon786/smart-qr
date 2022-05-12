import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  factory QrAction.phone(BarcodePhone barcodePhone) {
    return QrAction(
      FatButton(
        onLongPress: () => print(barcodePhone.rawValue),
        icon: Icons.phone_rounded,
        text: 'Call',
        onPressed: () => launch(barcodePhone.rawValue),
      ),
    );
  }

  factory QrAction.sms(BarcodeSms barcodeSms) {
    return QrAction(
      FatButton(
        onLongPress: () => print(barcodeSms.rawValue),
        icon: Icons.sms_outlined,
        text: 'Send Message',
        onPressed: () => {
          Clipboard.setData(ClipboardData(text: barcodeSms.message)).then((_) {
            launch('sms:${barcodeSms.phoneNumber}');
          })
        },
      ),
    );
  }

  factory QrAction.email(BarcodeEmail barcodeEmail) {
    return QrAction(
      FatButton(
        onLongPress: () => print(barcodeEmail.rawValue),
        icon: Icons.email_outlined,
        text: 'Send Email',
        onPressed: () {
          String? encodeQueryParameters(Map<String, String> params) {
            return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
          }

          final Uri emailLaunchUri = Uri(
            scheme: 'mailto',
            path: barcodeEmail.recipients[0],
            query: encodeQueryParameters(<String, String>{
              'subject': barcodeEmail.subject ?? '',
              'body': barcodeEmail.body ?? '',
            }),
          );

          launch(emailLaunchUri.toString());
        },
      ),
    );
  }

  factory QrAction.location(BarcodeLocation barcodeLocation) {
    return QrAction(
      FatButton(
        onLongPress: () => print(barcodeLocation.rawValue),
        icon: Icons.map,
        text: 'Open in Map',
        onPressed: () {
          var latitude = barcodeLocation.latitude;
          var longitude = barcodeLocation.longitude;
          launch('geo:$latitude,$longitude?q=$latitude,$longitude');
        },
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
