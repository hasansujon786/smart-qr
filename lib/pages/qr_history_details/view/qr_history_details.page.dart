import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../models/models.dart';
import '../../../pages/qr_result/qr_result.dart';
import '../../../providers/providers.dart';

class QrHistoryDetailsPage extends StatelessWidget {
  const QrHistoryDetailsPage({Key? key}) : super(key: key);

  static const routeName = '/qr_history_details';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final history = args['history'] as QrHistory;
    final rawCode = history.rawValue;
    final qrcode = qr_tools.parse(rawCode);

    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Details'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context, true),
            icon: const Icon(Icons.delete),
          ),
          Consumer(builder: (context, WidgetRef ref, child) {
            var favs = ref.watch(qrFavProvider);
            var isFav = favs.indexWhere((el) => el.id == history.id) > -1;
            return IconButton(
              onPressed: () {
                if (isFav) {
                  ref.read(qrFavProvider.notifier).remove(id: history.id);
                } else {
                  ref.read(qrFavProvider.notifier).add(rawCode, history.typeAsEnum, history.id);
                }
              },
              icon: Icon(isFav ? Icons.star : Icons.star_border_outlined),
            );
          })
        ],
      ),
      body: ResultView(qrcode: qrcode, rawCode: rawCode),
    );
  }
}
