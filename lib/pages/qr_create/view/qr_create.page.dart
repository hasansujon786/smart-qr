import 'package:flutter/material.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../qr_view/qr_view.dart';
import '../qr_create.dart';

class QrCreatePage extends StatefulWidget {
  const QrCreatePage({Key? key}) : super(key: key);

  static const routeName = '/qr_create';

  @override
  State<QrCreatePage> createState() => _QrCreatePageState();
}

class _QrCreatePageState extends State<QrCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formState = {};

  void _updateFromData(String key, String val) {
    _formState[key] = val;
  }

  void _onDone(qr_tools.QrcodeValueType qrcodeType) {
    _formKey.currentState?.save();
    var qrcodeRawValue = qr_tools.encodeToMeCard(qrcodeType, _formState);
    Navigator.pushNamed(context, QrView.routeName, arguments: {
      'qrcodeRawValue': qrcodeRawValue.toString(),
    });
  }

  //***************************** Widget *************************** //
  @override
  Widget build(BuildContext context) {
    final qrcodeType = ModalRoute.of(context)!.settings.arguments as qr_tools.QrcodeValueType;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create QR code'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: Form(
                    key: _formKey,
                    child: buildQrInputFeilds(qrcodeType),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _onDone(qrcodeType),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Done'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildQrInputFeilds(qr_tools.QrcodeValueType qrcodeType) {
    switch (qrcodeType) {
      case qr_tools.QrcodeValueType.wifi:
        return QrInputWifi(updateFormData: _updateFromData);
      case qr_tools.QrcodeValueType.phone:
        return QrInputTel(updateFormData: _updateFromData);
      case qr_tools.QrcodeValueType.text:
      default:
        return QrInputText(updateFormData: _updateFromData);
    }
  }
}
