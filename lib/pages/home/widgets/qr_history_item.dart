import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../pages/qr_result/qr_result.dart';
import '../../../ui/widgets/qr_icon.dart';

final _radius = Constants.borderRadius;

class QrHistoryItem extends StatelessWidget {
  final QrHistory history;
  final int index;
  final Function onDelete;
  const QrHistoryItem(this.history, {Key? key, required this.index, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QrType qrTypeData = QrType.findByValueType(history.typeAsEnum);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        onTap: () async {
          var shouldDelete = await Navigator.pushNamed(context, QrHistoryDetailsPage.routeName, arguments: {
            'qr_id': history.id,
            'rawcode': history.rawValue,
            'is_fav_page': false,
          });
          if (shouldDelete != null && shouldDelete == true) {
            onDelete();
          }
        },
        tileColor: theme.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
        leading: QrIcon(color: qrTypeData.color, icon: qrTypeData.icon),
        title: Text(
          qrTypeData.name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Palette.textDark),
        ),
        subtitle: Text(
          'qr details',
          style: theme.textTheme.bodySmall?.copyWith(color: Palette.textMuted),
        ),
        trailing: Icon(Icons.chevron_right, color: theme.dividerColor),
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
