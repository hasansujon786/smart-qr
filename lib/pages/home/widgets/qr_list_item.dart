import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../ui/widgets/qr_icon.dart';

class QrListItem extends StatelessWidget {
  final int index;
  final QrType qrTypeData;
  final String qrDetails;
  final VoidCallback onTap;
  final VoidCallback? onLongPress;
  final bool selectMode;
  final bool selected;
  const QrListItem({
    Key? key,
    required this.index,
    required this.qrTypeData,
    required this.qrDetails,
    required this.onTap,
    this.onLongPress,
    this.selectMode = false,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: ListTile(
        onLongPress: onLongPress,
        onTap: onTap,
        tileColor: theme.cardColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.borderRadius)),
        leading: QrIcon(color: qrTypeData.color, icon: qrTypeData.icon),
        title: Text(qrTypeData.name, style: theme.textTheme.titleLarge?.copyWith(fontSize: 18)),
        subtitle: Text(qrDetails, style: theme.textTheme.bodySmall?.copyWith(color: Palette.textMuted)),
        trailing: !selectMode
            ? Icon(Icons.chevron_right, color: theme.dividerColor)
            : !selected ? Icon(Icons.circle_rounded, color: theme.dividerColor) : const Icon(Icons.check_circle, color: Colors.green),
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

