import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/config.dart';
import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../providers/providers.dart';
import '../../../ui/ui.dart';
import '../../qr_view/qr_view.dart';
import '../qr_create.dart';

class QrCreatePage extends ConsumerStatefulWidget {
  static const routeName = '/qr_create';

  const QrCreatePage({Key? key}) : super(key: key);

  @override
  _QrCreatePageState createState() => _QrCreatePageState();
}

class _QrCreatePageState extends ConsumerState<QrCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formState = {};

  void _updateFromData(String key, String val) {
    _formState[key] = val;
  }

  void _onGenerateQrCode(BarcodeValueType qrcodeType) {
    FocusScope.of(context).unfocus();
    final isValidated = _formKey.currentState?.validate();
    if (isValidated != null && isValidated) {
      _formKey.currentState?.save();
      String qrcodeRawValue = qr_tools.encodeToBarCode(qrcodeType, _formState);
      Navigator.pushNamed(context, QrView.routeName, arguments: {
        'qrcodeRawValue': qrcodeRawValue,
        'qrcodeType': qrcodeType,
      });
    }
  }

  //***************************** Widget *************************** //
  @override
  Widget build(BuildContext context) {
    final qrcodeType = ModalRoute.of(context)!.settings.arguments as BarcodeValueType;
    final appSettings = ref.watch(settingsProvider);

    return Scaffold(
      backgroundColor: appSettings.isDarkMode ? Theme.of(context).canvasColor : Palette.appBackgroundLight,
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
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(Constants.verticalPadding),
        child: FatButton(
          text: 'Generate QR',
          icon: Icons.qr_code_rounded,
          onPressed: () => _onGenerateQrCode(qrcodeType),
        ),
      ),
    );
  }
}
