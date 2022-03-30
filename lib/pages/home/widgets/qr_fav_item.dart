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
    var qrTypeData = qrCodeTypes.firstWhere((e) => e.type == fav.typeAsEnum);

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
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_radius)),
        leading: QrIcon(color: qrTypeData.color, icon: qrTypeData.icon),
        title: Text(
          qrTypeData.name,
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
