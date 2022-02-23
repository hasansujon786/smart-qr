import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../domain/qr_to_picture.dart';
import '../qr_create.dart';

class QrCreatePage extends StatefulWidget {
  const QrCreatePage({Key? key}) : super(key: key);

  static const routeName = '/qr_create';

  @override
  State<QrCreatePage> createState() => _QrCreatePageState();
}

class _QrCreatePageState extends State<QrCreatePage> {
  //***************************** Statue *************************** //
  var _qrText = 'Any text here';
  final _forgroundColor = Colors.grey[600];
  final _backgroundColor = Colors.white;
  final _textController = TextEditingController(text: '');

  //***************************** Methods *************************** //
  void _updateQrView(text) {
    setState(() {
      _qrText = text;
    });
  }

  void _onDownload() async {
    _updateQrView(_textController.text);

    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }

    final success = await downloadQrPicture(_qrText, _forgroundColor, _backgroundColor) ?? false;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: success ? const Text('Image saved to Gallery') : const Text('Error saving image'),
    ));
  }

  //***************************** Widget *************************** //
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart QR'),
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
              // buildQr(),
              const SizedBox(height: 34),
              Form(
                child: buildQrInputFeilds(args['qrType'] ?? 'text'),
              ),
              ElevatedButton(
                onPressed: _onDownload,
                child: const Text('Done'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQr() {
    return QrImage(
      padding: const EdgeInsets.all(10),
      size: 250,
      data: _qrText,
      foregroundColor: _forgroundColor,
      backgroundColor: _backgroundColor,
    );
  }

  buildQrInputFeilds(String qrType) {
    switch (qrType) {
      case 'tel':
        return const QrInputTel();
      case 'text':
      default:
        return const QrInputText();
    }
  }
}
