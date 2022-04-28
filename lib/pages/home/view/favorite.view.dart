import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../providers/providers.dart';
import '../../../ui/ui.dart';
import '../widgets/widgets.dart';

class Favorite extends ConsumerWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var qrFavs = ref.watch(qrFavProvider);
    var qrFavsController = ref.read(qrFavProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,
        actions: [
          buildPopupMenu(qrFavsController),
        ],
      ),
      body: BottomNavBarPadding(
        child: ListView.builder(
          itemCount: qrFavs.length,
          itemBuilder: (BuildContext context, int index) {
            QrFav qr = qrFavs[index];
            return QrFavItem(qr, index: index, onDelete: () {
              // TODO: implement
              // qrHistoryController.remove(id: qr.id, index: index);
            });
          },
          padding: const EdgeInsets.all(12),
        ),
      ),
    );
  }

  Widget buildPopupMenu(qrFavsController) {
    return PopupMenuButton<_FavAppBarPopupMenu>(
      onSelected: (value) {
        switch (value) {
          case _FavAppBarPopupMenu.deleteAll:
            qrFavsController.clear();
            break;
          default:
        }
      },
      itemBuilder: (contex) => [
        const PopupMenuItem(
          value: _FavAppBarPopupMenu.deleteAll,
          child: PmItemChild(icon: Icons.delete_forever, text: 'Delete All'),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

enum _FavAppBarPopupMenu { deleteAll }
