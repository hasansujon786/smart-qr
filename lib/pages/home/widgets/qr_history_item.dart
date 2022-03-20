import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';

class QrHistoryItem extends StatelessWidget {
  const QrHistoryItem({Key? key, required this.history}) : super(key: key);
  final QrHistory history;

  @override
  Widget build(BuildContext context) {
    var qrType = qrCodeTypes.firstWhere((item) => item.type == history.type);

    return Container(
      margin: const EdgeInsets.only(top: 7),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        minLeadingWidth: 20,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        tileColor: Colors.white,
        onTap: () {
          // Navigator.pushNamed(ctx, QrCreatePage.routeName, arguments: qrType.type);
          // print(history.createdAt);
        },
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
          child: Icon(qrType.icon, color: Colors.white),
        ),
        title: Text(
          qrType.name,
          style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w500)),
        ),
        trailing: const Icon(Icons.chevron_right, color: Palette.lightGrey),
      ),
    );
  }
}
