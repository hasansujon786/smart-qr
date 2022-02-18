import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../domain/qr_to_picture.dart';

class QrCreateView extends StatefulWidget {
  const QrCreateView({Key? key}) : super(key: key);

  @override
  State<QrCreateView> createState() => _QrCreateViewState();
}

class _QrCreateViewState extends State<QrCreateView> {
  var _qrText = 'Any text here';

  final _forgroundColor = Colors.grey[600];

  final _backgroundColor = Colors.white;

  final _textController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    // Full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Height (without SafeArea)
    var padding = MediaQuery.of(context).padding;
    double height1 = height - padding.top - padding.bottom;

    // Height (without status bar)
    double height2 = height - padding.top;

    // Height (without status and toolbar)
    double height3 = height - padding.top - kToolbarHeight;

    void _updateQrView(text) {
      setState(() {
        _qrText = text;
      });
    }

    return Scaffold(
      body: Column(
        children: [
          QrImage(
            padding: const EdgeInsets.all(10),
            size: 250,
            data: _qrText,
            foregroundColor: _forgroundColor,
            backgroundColor: _backgroundColor,
          ),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Insert your QR code here',
            ),
            controller: _textController,
            onSubmitted: _updateQrView,
          ),
          ElevatedButton(
            onPressed: () => downloadQrPicture(_qrText, context, _forgroundColor, _backgroundColor),
            child: const Text('Download'),
          ),
        ],
      ),
    );
  }
}
