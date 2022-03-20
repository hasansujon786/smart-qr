import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';

class QrHistoryItem extends StatelessWidget {
  final QrHistory history;
  final int index;
  final Function onDelete;
  const QrHistoryItem(this.history, {Key? key, required this.index, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrType = qrCodeTypes.firstWhere((e) => e.type == history.typeAsEnum);
    const double rounded = 12;
    return InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed('/meals',
        //     arguments: {'id': id, 'title': title, 'color': color});
      },
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(rounded),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(rounded),
          color: Colors.white,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(qrType.icon, size: 38, color: Palette.darkerGrey),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'Delete') {
                    onDelete();
                  }
                },
                icon: Icon(Icons.more_vert, size: 30, color: Colors.grey.shade400),
                itemBuilder: (BuildContext context) {
                  return ['Delete'].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );
                  }).toList();
                },
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(qrType.name, style: Theme.of(context).textTheme.titleLarge),
                  Text('23.34', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}


// Center(
//   child: Material(
//     color: Colors.transparent,
//     child: Text(qr.type, style: const TextStyle(fontSize: 20.0)),
//   ),
// )
