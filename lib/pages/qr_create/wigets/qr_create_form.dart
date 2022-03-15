import 'package:flutter/material.dart';
import './wigets.dart';
import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;

class QrCreateForm extends StatelessWidget {
  const QrCreateForm(this.qrcodeType, this.updateFromData, {Key? key}) : super(key: key);

  final qr_tools.QrcodeValueType qrcodeType;
  final Function updateFromData;

  @override
  Widget build(BuildContext context) {
    switch (qrcodeType) {
      case qr_tools.QrcodeValueType.wifi:
        return QrInputWifi(updateFormData: updateFromData);

      case qr_tools.QrcodeValueType.phone:
        return QrInputTel(updateFormData: updateFromData);

      // case qr_tools.QrcodeValueType.url:
      //   return QrInputUrl(updateFormData: updateFromData);

      case qr_tools.QrcodeValueType.text:
      default:
        return QrInputText(updateFormData: updateFromData);
    }
  }
}
