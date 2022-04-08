import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../ui/ui.dart';
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

  void _onGenerateQrCode(BarcodeValueType qrcodeType) {
    FocusScope.of(context).unfocus();
    _formKey.currentState?.save();
    String qrcodeRawValue = qr_tools.encodeToMeCard(qrcodeType, _formState);
    Navigator.pushNamed(context, QrView.routeName, arguments: {
      'qrcodeRawValue': qrcodeRawValue,
      'qrcodeType': qrcodeType,
    });
  }

  void _log(BarcodeValueType qrcodeType) {
    _formKey.currentState?.save();
    // print(_formState);

    var qrcodeRawValue = qr_tools.encodeToMeCard(qrcodeType, _formState);
    print(qrcodeRawValue);
  }

  //***************************** Widget *************************** //
  @override
  Widget build(BuildContext context) {
    final qrcodeType = ModalRoute.of(context)!.settings.arguments as BarcodeValueType;

    return Scaffold(
      backgroundColor: Color(hexColor('#fcfcfc')),
      appBar: AppBar(
        title: const Text('Create QR code'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _onGenerateQrCode(qrcodeType),
            icon: const Icon(Icons.done_all),
          ),
        ],
      ),
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: Constants.verticalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: QrCreateForm(qrcodeType, _updateFromData),
              ),
              const SizedBox(height: 30),
              FatButton(
                text: 'Generate QR',
                icon: Icons.qr_code_rounded,
                onPressed: () => _onGenerateQrCode(qrcodeType),
                // onLongPress: () => _log(qrcodeType),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
