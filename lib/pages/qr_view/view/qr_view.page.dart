import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../ui/ui.dart';

class QrView extends StatefulWidget {
  const QrView({Key? key}) : super(key: key);

  static const routeName = '/qr_view';

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  final _forgroundColor = Colors.grey[700];
  final _backgroundColor = Colors.white;

  void _onDownload(qrcodeRawValue) async {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild!.unfocus();
    }

    final success = await qr_tools.downloadQrAsPng(qrcodeRawValue, _forgroundColor, _backgroundColor) ?? false;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: success ? const Text('Image saved to Gallery') : const Text('Error saving image'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final qrcodeRawValue = args['qrcodeRawValue'] as String;
    // final qrcodeType = args['qrcodeType'] as BarcodeValueType;
    // final qrTypeData = qrCodeTypes.firstWhere((e) => e.type == qrcodeType);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Preview'),
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
              _buildQrcodeView(qrcodeRawValue),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _onDownload(qrcodeRawValue),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Download'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQrcodeView(rawData) {
    return WrapperCard(
      blurRadius: 4,
      child: QrImage(
        size: 250,
        data: rawData,
        foregroundColor: _forgroundColor,
        backgroundColor: _backgroundColor,
      ),
    );
  }
}
