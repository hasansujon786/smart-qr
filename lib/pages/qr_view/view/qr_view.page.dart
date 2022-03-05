import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;

class QrView extends StatefulWidget {
  const QrView({Key? key}) : super(key: key);

  static const routeName = '/qr_view';

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  final _forgroundColor = Colors.grey[600];
  final _backgroundColor = Colors.white;

  void _onDownload(qrCode) async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }

    final success = await qr_tools.downloadQrAsPng(qrCode, _forgroundColor, _backgroundColor) ?? false;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: success ? const Text('Image saved to Gallery') : const Text('Error saving image'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String?>;
    final qrCode = args['qrCode'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Code'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              buildQr(qrCode),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _onDownload(qrCode),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Download'),
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildQr(data) {
    return QrImage(
      padding: const EdgeInsets.all(10),
      size: 250,
      data: data,
      foregroundColor: _forgroundColor,
      backgroundColor: _backgroundColor,
    );
  }
}
