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
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(hiveBoxQrHistory).listenable(),
        builder: (context, Box box, widget) {
          return GridView.builder(
            itemCount: box.length,
            itemBuilder: (BuildContext context, int index) {
              QrHistory qr = box.getAt(index);
              return QrHistoryItem(qr, index: index, onDelete: () {
                box.deleteAt(index);
              });
            },
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 3 / 2.5,
              maxCrossAxisExtent: 300,
            ),
          );
        },
      ),
    );
  }
}
