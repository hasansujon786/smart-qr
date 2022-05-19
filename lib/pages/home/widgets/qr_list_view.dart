import 'package:flutter/material.dart';

import '../../../models/models.dart';
import '../../../pages/home/widgets/widgets.dart';
import '../../../ui/ui.dart';

class QrListView extends StatefulWidget {
  final List<dynamic> qrList;
  final dynamic qrListController;
  final Function onItemTap;
  final String title;
  const QrListView({
    Key? key,
    required this.title,
    required this.qrList,
    this.qrListController,
    required this.onItemTap,
  }) : super(key: key);

  @override
  _QrListViewState createState() => _QrListViewState();
}

class _QrListViewState extends State<QrListView> {
  bool _isMultiSelectMode = false;
  var _selectedItemsIdx = <int>[];

  @override
  Widget build(BuildContext context) {
    // var qrHistories = ref.watch(qrHistoryProvider).reversed.toList();
    // var qrHistoryController = ref.read(qrHistoryProvider.notifier);

    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: _isMultiSelectMode
              ? buildSelectModeActions(widget.qrListController, widget.qrList.length)
              : [buildPopupMenu(widget.qrListController)],
        ),
        body: BottomNavBarPadding(
          child: ListView.builder(
            itemCount: widget.qrList.length,
            itemBuilder: (BuildContext context, int index) {
              // QrHistory item = widget.qrList[index];
              var item = widget.qrList[index];
              return QrListItem(
                selectMode: _isMultiSelectMode,
                selected: _selectedItemsIdx.any((element) => element == index),
                index: index,
                qrTypeData: QrType.findByValueType(item.typeAsEnum),
                qrDetails: 'fooo sdfsdf',
                onTap: () {
                  if (_isMultiSelectMode) {
                    if (_selectedItemsIdx.contains(index)) {
                      setState(() => _selectedItemsIdx.remove(index));
                    } else {
                      setState(() => _selectedItemsIdx.add(index));
                    }
                  } else {
                    widget.onItemTap(index);
                    // viewQrHistory(widget.qrHistoryController, qrHistory, index);
                  }
                },
                onLongPress: () {
                  if (_isMultiSelectMode) return;

                  setState(() {
                    _isMultiSelectMode = true;
                    _selectedItemsIdx.add(index);
                  });
                },
              );
            },
            padding: const EdgeInsets.all(12),
          ),
        ),
      ),
      onWillPop: () {
        if (_isMultiSelectMode) {
          setState(() {
            _selectedItemsIdx = [];
            _isMultiSelectMode = false;
          });
          return Future.value(false);
        }
        return Future.value(true);
      },
    );
  }

  List<Widget> buildSelectModeActions(qrHistoryController, int qrHistoriesLenght) {
    return [
      IconButton(
        onPressed: () {
          // ListView Items are reversed, so _selectedItemsIdx current index needs to be reversed
          var reversedItemsIdx = _selectedItemsIdx.map((e) => qrHistoriesLenght - (e + 1));

          qrHistoryController.removeMultiple(reversedItemsIdx);
          setState(() {
            _selectedItemsIdx = [];
            _isMultiSelectMode = false;
          });
        },
        icon: const Icon(Icons.delete),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            _isMultiSelectMode = false;
            _selectedItemsIdx = [];
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
