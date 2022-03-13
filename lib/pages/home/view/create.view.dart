import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../qr_create/qr_create.dart';

class CreateView extends StatelessWidget {
  const CreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            ...qrCodeTypes.map((qtType) => buildListItem(context, qtType))
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  buildListItem(BuildContext ctx, QrType qrType) {
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
          Navigator.pushNamed(ctx, QrCreatePage.routeName, arguments: qrType.type);
        },
        leading: CircleAvatar(
          backgroundColor: Theme.of(ctx).colorScheme.primary.withOpacity(0.5),
          child: Icon(qrType.icon, color: Colors.white),
        ),
        title: Text(
          qrType.name,
          style: Theme.of(ctx).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w500)),
        ),
        trailing: const Icon(Icons.chevron_right, color: Palette.lightGrey),
      ),
    );
  }
}
