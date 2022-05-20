import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../pages/qr_result/qr_result.dart';
import '../../../providers/history_provider.dart';
import '../widgets/widgets.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var qrHistories = ref.watch(qrHistoryProvider).reversed.toList();
    var qrHistoryController = ref.read(qrHistoryProvider.notifier);
    return QrListView(
      title: 'History',
      qrList: qrHistories,
      qrListController: qrHistoryController,
      onItemTap: (int index) {
        viewQrHistory(context, qrHistoryController, index, qrHistories[index]);
      },
    );
  }

  void viewQrHistory(context, qrHistoryController, int index, QrHistory qrHistory) async {
    var shouldDelete = await Navigator.pushNamed(context, QrHistoryDetailsPage.routeName, arguments: {
      'qr_id': qrHistory.id,
      'rawcode': qrHistory.rawValue,
      'is_fav_page': false,
      'qr_createdAt': qrHistory.createdAt
    });
    if (shouldDelete != null && shouldDelete == true) {
      qrHistoryController.remove(id: qrHistory.id, index: index);
    }
  }
}


// Read hive box direactly
// body: ValueListenableBuilder(
//   valueListenable: Hive.box(hiveBoxQrHistory).listenable(),
//   builder: (context, Box box, widget) {
//     return ListView.builder(
//       itemCount: box.length,
//       itemBuilder: (BuildContext context, int index) {
//         QrHistory qr = box.getAt(index);
//         // box.clear();
//         return QrHistoryItem(qr, index: index, onDelete: () {
//           box.deleteAt(index);
//         });
//       },
//       padding: const EdgeInsets.all(12),
//     );
//   },
// ),
