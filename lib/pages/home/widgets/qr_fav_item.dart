import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../ui/widgets/qr_icon.dart';

final _radius = Constants.borderRadius;

class QrFavItem extends StatelessWidget {
  final QrFav history;
  final int index;
  final Function onDelete;
  const QrFavItem(this.history, {Key? key, required this.index, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var qrType = qrCodeTypes.firstWhere((e) => e.type == history.typeAsEnum);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        onTap: () async {
          // var shouldDelete = await Navigator.pushNamed(context, QrHistoryDetailsPage.routeName, arguments: {
          //   'history': history,
          // });
          // if (shouldDelete != null && shouldDelete == true) {
          //   onDelete();
          // }
        },
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
        leading: QrIcon(color: qrType.color, icon: qrType.icon),
        title: Text(
          qrType.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Palette.textDark),
        ),
        subtitle: Text(
          'qr details',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Palette.textMuted),
        ),
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
