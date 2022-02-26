import 'package:flutter/material.dart';

import '../../../domain/text_to_qr_code.dart';
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

  void _onDone(String qrType) {
    _formKey.currentState?.save();
    var qrCode = textToQrCode(qrType, _formState);
    Navigator.restorablePushNamed(context, QrView.routeName, arguments: {'qrCode': qrCode});
  }

  //***************************** Widget *************************** //
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Qr code'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Form(
                key: _formKey,
                child: buildQrInputFeilds(args['qrType'] ?? 'text'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _onDone(args['qrType'] ?? 'text'),
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

  buildQrInputFeilds(String qrType) {
    switch (qrType) {
      case 'tel':
        return const QrInputTel();
      case 'text':
      default:
        return QrInputText(updateFormData: _updateFromData);
    }
  }
}
