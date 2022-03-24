import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../pages/qr_history_details/qr_history_detatils.dart';
import '../../../ui/widgets/qr_icon.dart';

final radius = Constants.borderRadius;

class QrHistoryItem extends StatelessWidget {
  final QrHistory history;
  final int index;
  final Function onDelete;
  const QrHistoryItem(this.history, {Key? key, required this.index, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrType = qrCodeTypes.firstWhere((e) => e.type == history.typeAsEnum);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        onTap: () async {
          var shouldDelete = await Navigator.pushNamed(context, QrHistoryDetailsPage.routeName, arguments: {
            'history': history,
          });
          if (shouldDelete != null && shouldDelete == true) {
            onDelete();
          }
        },
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        leading: QrIcon(color: qrType.color, icon: qrType.icon),
        title: Text(qrType.name, style: Theme.of(context).textTheme.titleLarge),
        subtitle: Text('qr details', style: Theme.of(context).textTheme.bodySmall),
        trailing: Icon(Icons.chevron_right, color: Colors.grey.shade300),
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
