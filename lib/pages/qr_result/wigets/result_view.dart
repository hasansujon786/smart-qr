import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../ui/ui.dart';
import '../wigets/wigets.dart';

class ResultView extends StatelessWidget {
  final String qrId;
  final String pageTitle;
  final Barcode qrcode;
  final String rawCode;
  final bool showDelete;
  final DateTime? createdAt;
  const ResultView({
    Key? key,
    required this.qrId,
    required this.qrcode,
    required this.rawCode,
    required this.createdAt,
    this.showDelete = false,
    this.pageTitle = 'Result',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resultItems = _buildResultItems(context, qrcode);

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        centerTitle: true,
        actions: [
          if (showDelete)
            IconButton(
              onPressed: () => Navigator.pop(context, true),
              icon: const Icon(Icons.delete),
            ),
          IconButton(
            onPressed: () {
              copyTextWithFeedback(context, resultItems.copyText);
            },
            icon: const Icon(Icons.copy),
          ),
          const SizedBox(width: 4)
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Constants.verticalPadding),
        child: Column(children: [
          const SizedBox(height: 24),
          ResultViewHeader(
            qrcode: qrcode,
            qrId: qrId,
            copyText: resultItems.copyText,
            details: createdAt == null ? '' : getDate(createdAt),
          ),
          const SizedBox(height: 40),
          ...resultItems.rItems,
        ]),
      ),
      bottomNavigationBar: buildMainActionBar(context, resultItems),
    );
  }

  Widget buildMainActionBar(BuildContext context, ResultItems resultItems) {
    return Padding(
      padding: EdgeInsets.all(Constants.verticalPadding),
      child: resultItems.mainAction ??
          FatButton(
            icon: Icons.copy_rounded,
            text: 'Copy Text',
            onPressed: () => copyTextWithFeedback(context, resultItems.copyText),
          ),
    );
  }
}

ResultItems _buildResultItems(BuildContext context, Barcode barcode) {
  String copyText;

  switch (barcode.valueType) {
    case BarcodeValueType.product:
      BarcodeProduct barcodeProduct = barcode as BarcodeProduct;
      copyText = 'Product Code: ${barcodeProduct.code}';
      return ResultItems(
        [QrResultItem(title: 'Product Code', content: barcodeProduct.code.toString())],
        copyText: copyText,
        mainAction: QrAction.product(barcodeProduct, context),
      );

    case BarcodeValueType.location:
      BarcodeLocation barcodeLocation = barcode as BarcodeLocation;
      String lat = barcodeLocation.latitude.toString();
      String long = barcodeLocation.longitude.toString();
      copyText = 'Latitude: $lat Longitude: $long \nQuery $lat,$long';
      return ResultItems(
        [
          QrResultItem(title: 'Latitude', content: lat),
          QrResultItem(title: 'Longitude', content: long),
        ],
        copyText: copyText,
        mainAction: QrAction.location(barcodeLocation),
      );

    case BarcodeValueType.url:
      BarcodeUrl barcodeUrl = barcode as BarcodeUrl;
      copyText = '${barcodeUrl.url}';
      return ResultItems(
        [QrResultItem(title: 'Url', content: barcodeUrl.url ?? '')],
        copyText: copyText,
        mainAction: QrAction.url(barcodeUrl),
      );

    case BarcodeValueType.email:
      BarcodeEmail barcodeEmail = barcode as BarcodeEmail;
      // TODO: get recipients name
      String email = barcodeEmail.recipients[0];
      copyText = 'Email: $email \nSubject: ${barcodeEmail.subject} \nMessage: ${barcodeEmail.body}';
      return ResultItems(
        [
          // ...barcodeEmail.recipients.map((recipient) {
          //   return recipient == '' ? Container() : QrResultItem(title: 'Email', content: recipient);
          // }),
          QrResultItem(title: 'Email', content: email),
          QrResultItem(title: 'Subject', content: barcodeEmail.subject ?? ''),
          QrResultItem(title: 'Message', content: barcodeEmail.body ?? ''),
        ],
        copyText: copyText,
        mainAction: QrAction.email(barcodeEmail),
      );

    case BarcodeValueType.sms:
      BarcodeSms barcodeSms = barcode as BarcodeSms;
      copyText = 'Phone number: ${barcodeSms.phoneNumber} \nMessage: ${barcodeSms.message}';
      return ResultItems(
        [
          QrResultItem(title: 'Phone Number', content: barcodeSms.phoneNumber ?? ''),
          QrResultItem(title: 'Message', content: barcodeSms.message ?? ''),
        ],
        copyText: copyText,
        mainAction: QrAction.sms(barcodeSms),
      );

    case BarcodeValueType.wifi:
      BarcodeWifi barcodeWifi = barcode as BarcodeWifi;
      String? encryptionType = barcodeWifi.encryptionType?.name;
      copyText = 'SSID: ${barcodeWifi.ssid} \nPassword: ${barcodeWifi.password}';

      return ResultItems(
        [
          QrResultItem(title: 'SSID', content: barcodeWifi.ssid ?? ''),
          QrResultItem(title: 'Password', content: barcodeWifi.password ?? ''),
          QrResultItem(title: 'Network Encryption', content: encryptionType?.toUpperCase() ?? ''),
        ],
        copyText: copyText,
        mainAction: QrAction.wifi(barcodeWifi, context),
      );

    case BarcodeValueType.phone:
      BarcodePhone barcodePhone = barcode as BarcodePhone;
      copyText = '${barcodePhone.number}';
      return ResultItems(
        [QrResultItem(title: 'Number', content: barcodePhone.number ?? '')],
        copyText: copyText,
        mainAction: QrAction.phone(barcodePhone),
      );

    case BarcodeValueType.text:
      BarcodeText barcodeText = barcode as BarcodeText;
      copyText = barcodeText.rawValue;
      return ResultItems(
        [QrResultItem(title: 'Text', content: barcodeText.rawValue)],
        copyText: copyText,
      );

    default:
      copyText = barcode.rawValue;
      return ResultItems(
        [QrResultItem(title: '', content: barcode.rawValue)],
        copyText: copyText,
      );

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
  final String copyText;
  final Widget? mainAction;

  ResultItems(this.rItems, {required this.copyText, this.mainAction});
}
