import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../pages/qr_result/qr_result.dart';
import '../../../providers/history_provider.dart';
import '../../../ui/ui.dart';
import '../widgets/widgets.dart';

class HistoryView extends ConsumerStatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  _HistoryViewState createState() => _HistoryViewState();
}

class _HistoryViewState extends ConsumerState<HistoryView> {
  void viewQrHistory(qrHistoryController, QrHistory qrHistory, int index) async {
    var shouldDelete = await Navigator.pushNamed(context, QrHistoryDetailsPage.routeName, arguments: {
      'qr_id': qrHistory.id,
      'rawcode': qrHistory.rawValue,
      'is_fav_page': false,
    });
    if (shouldDelete != null && shouldDelete == true) {
      qrHistoryController.remove(id: qrHistory.id, index: index);
    }
  }

  bool _isMultiSelectMode = false;
  var _selectedItemIdxs = <int>[];

  @override
  Widget build(BuildContext context) {
    var qrHistories = ref.watch(qrHistoryProvider).reversed.toList();
    var qrHistoryController = ref.read(qrHistoryProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        actions:
            _isMultiSelectMode ? buildSelectModeAction(qrHistoryController) : [buildPopupMenu(qrHistoryController)],
      ),
      body: BottomNavBarPadding(
        child: ListView.builder(
          itemCount: qrHistories.length,
          itemBuilder: (BuildContext context, int index) {
            QrHistory qrHistory = qrHistories[index];
            return QrListItem(
              selectMode: _isMultiSelectMode,
              selected: _selectedItemIdxs.any((element) => element == index),
              index: index,
              qrTypeData: QrType.findByValueType(qrHistory.typeAsEnum),
              qrDetails: 'qr details',
              onTap: () {
                if (_isMultiSelectMode) {
                  if (_selectedItemIdxs.contains(index)) {
                    setState(() => _selectedItemIdxs.remove(index));
                  } else {
                    setState(() => _selectedItemIdxs.add(index));
                  }
                  print(_selectedItemIdxs);
                } else {
                  viewQrHistory(qrHistoryController, qrHistory, index);
                }
              },
              onLongPress: () {
                if (_isMultiSelectMode) return;

                setState(() {
                  _isMultiSelectMode = true;
                  _selectedItemIdxs.add(index);
                });
                print(_selectedItemIdxs);
              },
            );
          },
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }

  List<Widget> buildSelectModeAction(QrHistoryNotifier qrHistoryController) {
    return [
      IconButton(
        onPressed: () {
          qrHistoryController.removeMultiple(_selectedItemIdxs);
          setState(() {
            _selectedItemIdxs = [];
            _isMultiSelectMode = false;
          });
        },
        icon: const Icon(Icons.delete),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            _isMultiSelectMode = false;
            _selectedItemIdxs = [];
          });
        },
        icon: const Icon(Icons.close),
      )
    ];
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
