import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../providers/providers.dart';
import '../wigets/wigets.dart';

class QrResultPage extends ConsumerWidget {
  const QrResultPage({Key? key}) : super(key: key);
  static const routeName = '/qr_result';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final rawCode = args['qrcodeRawValue'] ?? '';
    final qrcode = qr_tools.parse(rawCode);

    Future.delayed(const Duration(seconds: 1), () {
      ref.read(qrHistoryProvider.notifier).add(qrcode.rawValue, qrcode.valueType);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: ResultView(qrcode: qrcode, rawCode: rawCode),
    );
  }
}

class ResultView extends StatefulWidget {
  const ResultView({
    Key? key,
    required this.qrcode,
    required this.rawCode,
  }) : super(key: key);

  final Barcode qrcode;
  final String rawCode;

  @override
  _ResultViewState createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  String? _copyText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(children: [
            const SizedBox(height: 40),
            QrTypeLogo(widget.qrcode),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildResultItems(widget.qrcode),
              ),
            ),
          ]),
        ),
        _buildFatButton(_copyText, widget.rawCode),
      ],
    );
  }

  _buildFatButton(copyText, rawCode) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      width: double.infinity,
      // color: Colors.red,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
        ),
        onLongPress: () => print(rawCode),
        onPressed: () {
          Clipboard.setData(ClipboardData(text: copyText)).then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Text copied'),
                duration: Duration(seconds: 3),
              ),
            );
          });
        },
        child: const Text('Copy Text', style: TextStyle(fontSize: 16)),
      ),
    );
  }

  List<Widget> _buildResultItems(Barcode barcode) {
    switch (barcode.valueType) {
      // case BarcodeValueType.contactInfo:
      //   BarcodeContactInfo barcodeContactInfo = barcode as BarcodeContactInfo;
      //   break;
      // case BarcodeValueType.location:
      //   BarcodeLocation barcodeLocation = barcode as BarcodeLocation;
      //   break;
      // case BarcodeValueType.calendarEvent:
      //   BarcodeCalendarEvent barcodeCalendarEvent = barcode as BarcodeCalendarEvent;
      //   break;
      // case BarcodeValueType.driverLicense:
      //   BarcodeDriverLicense barcodeDriverLicense = barcode as BarcodeDriverLicense;
      //   break;

      case BarcodeValueType.sms:
        BarcodeSms barcodeSms = barcode as BarcodeSms;
        return [
          QrResultItem(title: 'Phone Number', content: barcodeSms.phoneNumber ?? ''),
          QrResultItem(title: 'Message', content: barcodeSms.message ?? ''),
        ];

      case BarcodeValueType.email:
        BarcodeEmail barcodeEmail = barcode as BarcodeEmail;
        return [
          ...barcodeEmail.recipients.map((recipient) {
            return recipient == '' ? Container() : QrResultItem(title: 'Email', content: recipient);
          }),
          QrResultItem(title: 'Subject', content: barcodeEmail.subject ?? ''),
          QrResultItem(title: '', content: barcodeEmail.body ?? ''),
        ];

      case BarcodeValueType.product:
        BarcodeProduct barcodeProduct = barcode as BarcodeProduct;
        return [
          QrResultItem(title: 'Product Code', content: barcodeProduct.code.toString()),
        ];

      case BarcodeValueType.url:
        BarcodeUrl barcodeUrl = barcode as BarcodeUrl;
        return [
          QrResultItem(title: 'Url', content: barcodeUrl.url ?? ''),
        ];

      case BarcodeValueType.wifi:
        BarcodeWifi barcodeWifi = barcode as BarcodeWifi;
        _copyText = barcodeWifi.password;
        return [
          QrResultItem(title: 'SSID', content: barcodeWifi.ssid ?? ''),
          QrResultItem(title: 'Password', content: barcodeWifi.password ?? ''),
        ];

      case BarcodeValueType.phone:
        BarcodePhone barcodePhone = barcode as BarcodePhone;
        _copyText = barcodePhone.number;
        return [
          QrResultItem(title: 'Number', content: barcodePhone.number ?? ''),
        ];

      case BarcodeValueType.text:
        BarcodeText barcodeText = barcode as BarcodeText;
        _copyText = barcodeText.rawValue;
        return [
          QrResultItem(title: '', content: barcodeText.rawValue),
        ];

      default:
        _copyText = barcode.rawValue;
        return [
          QrResultItem(title: '', content: barcode.rawValue),
        ];
    }
  }
}
