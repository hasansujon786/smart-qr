import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../providers/history_provider.dart';
import '../wigets/wigets.dart';

class QrResultPage extends ConsumerWidget {
  const QrResultPage({Key? key}) : super(key: key);
  static const routeName = '/qr_result';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrcode = ModalRoute.of(context)!.settings.arguments as Barcode;

    // bool isSupportedValue = qrCodeTypes.any((element) => element.type == qrcode.valueType);
    // if (!isSupportedValue) {
    //   Navigator.pop(context);
    //   FloatingSnackBar.showFloatingSnackBar(context, message: 'Unsupported QR Code', width: 180);
    // }

    final qrHistory = QrHistory(rawValue: qrcode.rawValue, type: qrcode.valueType.name);
    Future.delayed(const Duration(seconds: 1), () {
      ref.read(qrHistoryProvider.notifier).add(qrHistory);
    });

    return ResultView(
      qrId: qrHistory.id,
      qrcode: qrcode,
      createdAt: qrHistory.createdAt,
    );
  }
}
