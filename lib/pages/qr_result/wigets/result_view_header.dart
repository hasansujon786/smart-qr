import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../pages/qr_result/qr_result.dart';
import '../../../ui/ui.dart';

class ResultViewHeader extends StatelessWidget {
  final Barcode qrcode;
  final String qrId;
  final String copyText;
  const ResultViewHeader({
    Key? key,
    required this.qrcode,
    required this.qrId,
    required this.copyText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QrType qrType = QrType.findByValueType(qrcode.valueType);
    final theme = Theme.of(context);

    void _shareQrData() {
      Share.share(copyText);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          QrIcon(color: qrType.color, icon: qrType.icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(qrType.name, style: theme.textTheme.titleLarge?.copyWith(fontSize: 18)),
                const SizedBox(height: 4),
                Text('qr details', style: theme.textTheme.bodySmall?.copyWith(color: Palette.textMuted))
              ],
            ),
          ),
          AddToFav(qrcode: qrcode, qrId: qrId),
          const SizedBox(width: 2),
          IconButton(onPressed: _shareQrData, icon: const Icon(Icons.share, size: 30))
        ],
      ),
    );
  }
}
