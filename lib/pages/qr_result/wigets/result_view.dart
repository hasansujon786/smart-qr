import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../wigets/wigets.dart';

class ResultView extends StatelessWidget {
  final Barcode qrcode;
  final String rawCode;
  final AppBar appBar;
  const ResultView({
    Key? key,
    required this.qrcode,
    required this.rawCode,
    required this.appBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrType = qrCodeTypes.firstWhere((e) => e.type == qrcode.valueType);

    final resultItems = _buildResultItems(qrcode);

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Constants.verticalPadding),
        child: Column(children: [
          const SizedBox(height: 28),
          QrTypeLogo(qrType: qrType),
          const SizedBox(height: 40),
          ...resultItems.rItems,
        ]),
      ),
      bottomNavigationBar: CopyButton(copyText: resultItems.copyText ?? ''),
    );
  }
}

ResultItems _buildResultItems(Barcode barcode) {
  String copyText;

  switch (barcode.valueType) {
    case BarcodeValueType.product:
      BarcodeProduct barcodeProduct = barcode as BarcodeProduct;
      copyText = 'Product Code: ${barcodeProduct.code}';
      return ResultItems([
        QrResultItem(title: 'Product Code', content: barcodeProduct.code.toString()),
      ], copyText);

    case BarcodeValueType.url:
      BarcodeUrl barcodeUrl = barcode as BarcodeUrl;
      copyText = '${barcodeUrl.url}';
      return ResultItems([
        QrResultItem(title: 'Url', content: barcodeUrl.url ?? ''),
      ], copyText);

    case BarcodeValueType.email:
      BarcodeEmail barcodeEmail = barcode as BarcodeEmail;
      // TODO: get recipients name
      copyText = 'Subject: ${barcodeEmail.subject} \nMessage: ${barcodeEmail.body}';
      return ResultItems([
        ...barcodeEmail.recipients.map((recipient) {
          return recipient == '' ? Container() : QrResultItem(title: 'Email', content: recipient);
        }),
        QrResultItem(title: 'Subject', content: barcodeEmail.subject ?? ''),
        QrResultItem(title: 'Message', content: barcodeEmail.body ?? ''),
      ], copyText);

    case BarcodeValueType.sms:
      BarcodeSms barcodeSms = barcode as BarcodeSms;
      copyText = 'Phone number: ${barcodeSms.phoneNumber} \nMessage: ${barcodeSms.message}';
      return ResultItems([
        QrResultItem(title: 'Phone Number', content: barcodeSms.phoneNumber ?? ''),
        QrResultItem(title: 'Message', content: barcodeSms.message ?? ''),
      ], copyText);

    case BarcodeValueType.wifi:
      BarcodeWifi barcodeWifi = barcode as BarcodeWifi;
      copyText = 'SSID: ${barcodeWifi.ssid} \nPassword: ${barcodeWifi.password}';
      return ResultItems([
        QrResultItem(title: 'SSID', content: barcodeWifi.ssid ?? ''),
        QrResultItem(title: 'Password', content: barcodeWifi.password ?? ''),
      ], copyText);

    case BarcodeValueType.phone:
      BarcodePhone barcodePhone = barcode as BarcodePhone;
      copyText = '${barcodePhone.number}';
      return ResultItems([
        QrResultItem(title: 'Number', content: barcodePhone.number ?? ''),
      ], copyText);

    case BarcodeValueType.text:
      BarcodeText barcodeText = barcode as BarcodeText;
      copyText = barcodeText.rawValue;
      return ResultItems([
        QrResultItem(title: 'Text', content: barcodeText.rawValue),
      ], copyText);

    default:
      copyText = barcode.rawValue;
      return ResultItems([
        QrResultItem(title: '', content: barcode.rawValue),
      ], copyText);

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
  }
}

class ResultItems {
  final List<Widget> rItems;
  final String? copyText;
  ResultItems(this.rItems, this.copyText);
}
