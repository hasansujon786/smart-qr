import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../models/models.dart';
import '../../../providers/history_provider.dart';
import '../wigets/wigets.dart';

class QrResultPage extends ConsumerWidget {
  const QrResultPage({Key? key}) : super(key: key);
  static const routeName = '/qr_result';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final rawCode = args['qrcodeRawValue'] ?? '';
    final qrcode = qr_tools.parse(rawCode);

    final qrHistory = QrHistory(rawValue: qrcode.rawValue, type: qrcode.valueType.name);
    Future.delayed(const Duration(seconds: 1), () {
      ref.read(qrHistoryProvider.notifier).add(qrHistory);
    });

    return ResultView(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
        actions: [
          AddToFav(qrcode: qrcode, qrId: qrHistory.id),
        ],
      ),
      qrcode: qrcode,
      rawCode: rawCode,
    );
  }
}
