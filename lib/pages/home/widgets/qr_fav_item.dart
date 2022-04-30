import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../pages/qr_result/qr_result.dart';
import '../../../ui/widgets/qr_icon.dart';

final _radius = Constants.borderRadius;

class QrFavItem extends StatelessWidget {
  final QrFav fav;
  final int index;
  final Function onDelete;
  const QrFavItem(this.fav, {Key? key, required this.index, required this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QrType qrTypeData = QrType.findByValueType(fav.typeAsEnum);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        onTap: () {
          Navigator.pushNamed(context, QrHistoryDetailsPage.routeName, arguments: {
            'qr_id': fav.id,
            'rawcode': fav.rawValue,
            'is_fav_page': true,
          });
        },
        tileColor: theme.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
        leading: QrIcon(color: qrTypeData.color, icon: qrTypeData.icon),
        title: Text(qrTypeData.name, style: theme.textTheme.titleLarge?.copyWith(fontSize: 18)),
        subtitle: Text(
          'qr details',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Palette.textMuted),
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
