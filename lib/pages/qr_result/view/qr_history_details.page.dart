import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../pages/qr_result/qr_result.dart';

class QrHistoryDetailsPage extends StatelessWidget {
  const QrHistoryDetailsPage({Key? key}) : super(key: key);

  static const routeName = '/qr_history_details';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final qrId = args['qr_id'] as String;
    final rawCode = args['rawcode'] as String;
    final isFavPage = args['is_fav_page'] as bool;
    final createdAt = args['qr_createdAt'] as DateTime?;
    final Barcode qrcode = qr_tools.parse(rawCode);

    return ResultView(
      qrId: qrId,
      qrcode: qrcode,
      createdAt: createdAt,
      pageTitle: isFavPage ? 'QR Favorite' : 'QR History',
      showDelete: !isFavPage,
    );
  }
}
