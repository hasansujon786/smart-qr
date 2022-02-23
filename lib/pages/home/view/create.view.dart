import 'package:flutter/material.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 2),
              child: Text('Qr Code', style: Theme.of(context).textTheme.titleLarge),
            ),
            ...qrCodeTypes.map((qtType) => buildListItem(context, qtType))
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  buildListItem(BuildContext ctx, QrType qrType) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        tileColor: Colors.white,
        onTap: () {
          Navigator.restorablePushNamed(ctx, QrCreatePage.routeName, arguments: {'qrType': qrType.type});
        },
        title: Text(qrType.name, style: Theme.of(ctx).textTheme.titleMedium),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
