import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import './wigets.dart';

class QrCreateForm extends StatelessWidget {
  const QrCreateForm(this.qrcodeType, this.updateFromData, {Key? key}) : super(key: key);

  final BarcodeValueType qrcodeType;
  final Function updateFromData;

  @override
  Widget build(BuildContext context) {
    switch (qrcodeType) {
      case BarcodeValueType.url:
        return QrInputUrl(updateFormData: updateFromData);

      case BarcodeValueType.email:
        return QrInputEmail(updateFormData: updateFromData);

      case BarcodeValueType.sms:
        return QrInputSms(updateFormData: updateFromData);

      case BarcodeValueType.wifi:
        return QrInputWifi(updateFormData: updateFromData);

      case BarcodeValueType.phone:
        return QrInputTel(updateFormData: updateFromData);

      case BarcodeValueType.text:
      default:
        return QrInputText(updateFormData: updateFromData);
    }
  }
}
