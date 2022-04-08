import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../ui/ui.dart';
import '../wigets/wigets.dart';

class QrView extends StatefulWidget {
  const QrView({Key? key}) : super(key: key);

  static const routeName = '/qr_view';

  @override
  State<QrView> createState() => _QrViewState();
}

class _QrViewState extends State<QrView> {
  final Color _forgroundColor = Color(hexColor('#333333'));
  final Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final qrcodeRawValue = args['qrcodeRawValue'] as String;
    final qrcodeType = args['qrcodeType'] as BarcodeValueType;
    final qrType = qrCodeTypes.firstWhere((e) => e.type == qrcodeType);

    return Scaffold(
      appBar: AppBar(title: const Text('Qr Preview'), centerTitle: true),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(children: [
                _buildQrTypeName(qrType.name),
                const SizedBox(height: 16),
                _buildQrcodeView(qrcodeRawValue),
              ]),
            ),
            DownloadButton(qrcodeRawValue, fg: _forgroundColor, bg: _backgroundColor),
          ],
        ),
      ),
    );
  }

  Widget _buildQrcodeView(String rawData) {
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

  Widget _buildQrTypeName(name) {
    return WrapperCard(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
      child: Text(name,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              )),
    );
  }
}
