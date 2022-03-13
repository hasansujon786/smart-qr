import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../wigets/wigets.dart';

class QrResultPage extends StatefulWidget {
  const QrResultPage({Key? key}) : super(key: key);
  static const routeName = '/qr_result';

  @override
  State<QrResultPage> createState() => _QrResultPageState();
}

class _QrResultPageState extends State<QrResultPage> {
  String? _copyText = '';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final qrcode = qr_tools.parse(args['qrcodeRawValue'] ?? '');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(children: [
              const SizedBox(height: 40),
              QrTypeLogo(qrcode),
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: _buildResultView(qrcode),
              ),
            ]),
          ),
          _buildFatButton(_copyText),
        ],
      ),
    );
  }

  _buildFatButton(copyText) {
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

  Widget _buildResultView(Barcode barcode) {
    // print('==========================');
    // print(barcode.valueType);
    // print('==========================');

    switch (barcode.valueType) {
      // case BarcodeValueType.url:
      //   BarcodeUrl barcodeUrl = barcode as BarcodeUrl;
      //   break;
      // case BarcodeValueType.contactInfo:
      //   BarcodeContactInfo barcodeContactInfo = barcode as BarcodeContactInfo;
      //   break;
      // case BarcodeValueType.location:
      //   BarcodeLocation barcodeLocation = barcode as BarcodeLocation;
      //   break;
      // case BarcodeValueType.email:
      //   BarcodeEmail barcodeEmail = barcode as BarcodeEmail;
      //   break;
      // case BarcodeValueType.sms:
      //   BarcodeSms barcodeSms = barcode as BarcodeSms;
      //   break;
      // case BarcodeValueType.calendarEvent:
      //   BarcodeCalendarEvent barcodeCalendarEvent = barcode as BarcodeCalendarEvent;
      //   break;
      // case BarcodeValueType.driverLicense:
      //   BarcodeDriverLicense barcodeDriverLicense = barcode as BarcodeDriverLicense;
      //   break;
      // case BarcodeValueType.product:
      //   BarcodeProduct barcodeProduct = barcode as BarcodeProduct;
      //   break;
      case BarcodeValueType.wifi:
        BarcodeWifi barcodeWifi = barcode as BarcodeWifi;
        _copyText = barcodeWifi.password;
        return ResultWifi(barcodeWifi);

      case BarcodeValueType.phone:
        BarcodePhone barcodePhone = barcode as BarcodePhone;
        _copyText = barcodePhone.number;
        return ResultPhone(barcodePhone);

      case BarcodeValueType.text:
        BarcodeText barcodeText = barcode as BarcodeText;
        _copyText = barcodeText.rawValue;
        return ResultText(barcodeText);

      default:
        _copyText = barcode.rawValue;
        return ResultDefault(barcode);
    }
  }
}
