import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../domain/qr_to_picture.dart';

class QrCreateView extends StatefulWidget {
  const QrCreateView({Key? key}) : super(key: key);

  @override
  State<QrCreateView> createState() => _QrCreateViewState();
}

class _QrCreateViewState extends State<QrCreateView> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart QR'),
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
              buildQr(),
              const SizedBox(height: 24),
              buildTextFeild(),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _onDownload,
                child: const Text('Download'),
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

  buildTextFeild() {
    return TextField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Insert your QR code here',
      ),
      controller: _textController,
      onSubmitted: _updateQrView,
    );
  }
}
