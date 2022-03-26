import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/models.dart';
import '../widgets/widgets.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Hive.box(hiveBoxQrHistory).clear();
            },
            icon: const Icon(Icons.clear_all),
          )
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(hiveBoxQrHistory).listenable(),
        builder: (context, Box box, widget) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (BuildContext context, int index) {
              QrHistory qr = box.getAt(index);
              // box.clear();
              return QrHistoryItem(qr, index: index, onDelete: () {
                box.deleteAt(index);
              });
            },
            padding: const EdgeInsets.all(12),
          );
        },
      ),
    );
  }
}
