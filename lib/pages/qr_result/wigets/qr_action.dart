import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        onPressed: () => launchUrlString(barcodeUrl.url ?? '', mode: LaunchMode.externalApplication),
      ),
    );
  }

  factory QrAction.phone(BarcodePhone barcodePhone) {
    return QrAction(
      FatButton(
        icon: Icons.phone_rounded,
        text: 'Call',
        onPressed: () => launchUrlString(barcodePhone.rawValue),
      ),
    );
  }

  factory QrAction.sms(BarcodeSms barcodeSms) {
    return QrAction(
      FatButton(
        icon: Icons.sms_outlined,
        text: 'Send Message',
        onPressed: () {
          final Uri smsLaunchUri = Uri(
            scheme: 'sms',
            path: barcodeSms.phoneNumber,
            query: _encodeQueryParameters(<String, String>{
              'body': barcodeSms.message ?? '',
            }),
          );

          // print(smsLaunchUri.toFilePath());
          launchUrl(smsLaunchUri);
        },
      ),
    );
  }

  factory QrAction.email(BarcodeEmail barcodeEmail) {
    return QrAction(
      FatButton(
        icon: Icons.email_outlined,
        text: 'Send Email',
        onPressed: () {
          final Uri emailLaunchUri = Uri(
            scheme: 'mailto',
            path: barcodeEmail.recipients[0],
            query: _encodeQueryParameters(<String, String>{
              'subject': barcodeEmail.subject ?? '',
              'body': barcodeEmail.body ?? '',
            }),
          );

          launchUrl(emailLaunchUri);
        },
      ),
    );
  }

  factory QrAction.location(BarcodeLocation barcodeLocation) {
    return QrAction(
      FatButton(
        icon: Icons.map,
        text: 'Open in Map',
        onPressed: () {
          var latitude = barcodeLocation.latitude;
          var longitude = barcodeLocation.longitude;
          launchUrlString('geo:$latitude,$longitude?q=$latitude,$longitude');
        },
      ),
    );
  }

  factory QrAction.wifi(BarcodeWifi barcodeWifi, context) {
    return QrAction(
      FatButton(
        icon: Icons.wifi_outlined,
        text: 'Copy Password',
        onPressed: () {
          copyTextWithFeedback(context, barcodeWifi.password ?? '', message: 'Password copied..');
        },
      ),
    );
  }

  factory QrAction.product(BarcodeProduct barcodeProduct, context) {
    return QrAction(
      FatButton(
        icon: Icons.shopping_bag_outlined,
        text: 'Copy Code',
        onPressed: () {
          copyTextWithFeedback(context, barcodeProduct.code.toString(), message: 'Code copied..');
        },
      ),
    );
  }
}

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

String? _encodeQueryParameters(Map<String, String> params) {
  return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
}
