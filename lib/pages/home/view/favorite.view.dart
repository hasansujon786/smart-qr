import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../providers/providers.dart';
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
          IconButton(
            onPressed: () => qrFavsController.clear(),
            icon: const Icon(Icons.clear_all),
          )
        ],
      ),
      body: ListView.builder(
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
    );
  }
}
