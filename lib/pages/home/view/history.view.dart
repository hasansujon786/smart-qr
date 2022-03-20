import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../models/models.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final qrHistoryBox = Hive.box(hiveBoxQrHistory);

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box(hiveBoxQrHistory).listenable(),
        builder: (context, Box box, widget) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (BuildContext context, int index) {
              QrHistory person = box.getAt(index);
              return ListTile(
                title: Text(person.rawValue),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    box.deleteAt(index);
                  },
                ),
              );
            },
          );
        },
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final qrHistoryBox = Hive.box(hiveBoxQrHistory);
      //     qrHistoryBox.add(QrHistory(
      //       rawValue: 'rsdfsdfsd',
      //       type: BarcodeValueType.sms.name,
      //     ));
      //   },
      // ),
    );
  }
}
