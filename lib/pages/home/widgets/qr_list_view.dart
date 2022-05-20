import 'package:flutter/material.dart';

import '../../../config/config.dart';
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
    required this.onItemTap,
    required this.qrListController,
  }) : super(key: key);

  @override
  _QrListViewState createState() => _QrListViewState();
}

class _QrListViewState extends State<QrListView> {
  bool _isMultiSelectMode = false;
  var _selectedItemsIdx = <int>[];

  void delteAllItems() {
    // ListView Items are reversed, so _selectedItemsIdx current index needs to be reversed
    var reversedItemsIdx = _selectedItemsIdx.map((e) => widget.qrList.length - (e + 1));

    widget.qrListController.removeMultiple(reversedItemsIdx);
    exitMultiSelect();
  }

  void exitMultiSelect() {
    setState(() {
      _isMultiSelectMode = false;
      _selectedItemsIdx = [];
    });
  }

  void enterSelectMode(int? index) {
    if (_isMultiSelectMode) return;
    setState(() {
      _isMultiSelectMode = true;
      if (index != null) _selectedItemsIdx.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: buildAppTitle(),
          centerTitle: true,
          leading: _isMultiSelectMode ? IconButton(onPressed: exitMultiSelect, icon: const Icon(Icons.close)) : null,
          actions: [
            if (!_isMultiSelectMode) buildPopupMenu(widget.qrListController),
            if (_isMultiSelectMode) IconButton(onPressed: delteAllItems, icon: const Icon(Icons.delete)),
          ],
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
                qrDetails: getDate(item.createdAt),
                onTap: () {
                  if (_isMultiSelectMode) {
                    if (_selectedItemsIdx.contains(index)) {
                      setState(() => _selectedItemsIdx.remove(index));
                    } else {
                      setState(() => _selectedItemsIdx.add(index));
                    }
                  } else {
                    widget.onItemTap(index);
                  }
                },
                onLongPress: () => enterSelectMode(index),
              );
            },
            padding: const EdgeInsets.all(12),
          ),
        ),
      ),
      onWillPop: () {
        if (_isMultiSelectMode) {
          exitMultiSelect();
          return Future.value(false);
        }
        return Future.value(true);
      },
    );
  }

  Widget buildAppTitle() {
    var count = _selectedItemsIdx.length;
    String p = count > 1 ? 'items' : 'item';
    return Text(!_isMultiSelectMode ? widget.title : '$count $p selected');
  }

  Widget buildPopupMenu(qrListController) {
    return PopupMenuButton<_HistoryPopupAppBarMenu>(
      onSelected: (value) {
        switch (value) {
          case _HistoryPopupAppBarMenu.deleteAll:
            qrListController.clear();
            break;
          case _HistoryPopupAppBarMenu.enterSelectMode:
            enterSelectMode(null);
            break;
          default:
        }
      },
      itemBuilder: (contex) => [
        const PopupMenuItem(
          value: _HistoryPopupAppBarMenu.deleteAll,
          child: PopupMenuItemChild(icon: Icons.delete_forever, text: 'Delete All'),
        ),
        const PopupMenuItem(
          value: _HistoryPopupAppBarMenu.enterSelectMode,
          child: PopupMenuItemChild(icon: Icons.check_box_rounded, text: 'Select'),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

enum _HistoryPopupAppBarMenu {
  deleteAll,
  enterSelectMode,
}
