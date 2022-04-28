import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../providers/history_provider.dart';
import '../../../ui/ui.dart';
import '../widgets/widgets.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    var qrHistories = ref.watch(qrHistoryProvider);
    var qrHistoryController = ref.read(qrHistoryProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        actions: [
          buildPopupMenu(qrHistoryController),
        ],
      ),
      body: BottomNavBarPadding(
        child: ListView.builder(
          itemCount: qrHistories.length,
          itemBuilder: (BuildContext context, int index) {
            QrHistory qr = qrHistories[index];
            return QrHistoryItem(qr, index: index, onDelete: () {
              qrHistoryController.remove(id: qr.id, index: index);
            });
          },
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }

  Widget buildPopupMenu(qrHistoryController) {
    return PopupMenuButton<_HistoryPopupAppBarMenu>(
      onSelected: (value) {
        switch (value) {
          case _HistoryPopupAppBarMenu.deleteAll:
            qrHistoryController.clear();
            break;
          default:
        }
      },
      itemBuilder: (contex) => [
        const PopupMenuItem(
          value: _HistoryPopupAppBarMenu.deleteAll,
          child: PmItemChild(icon: Icons.delete_forever, text: 'Delete All'),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

enum _HistoryPopupAppBarMenu { deleteAll }

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
