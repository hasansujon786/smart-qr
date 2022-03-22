import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../ui/ui.dart';
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
      body: GridView.builder(
        itemCount: qrCodeTypes.length,
        itemBuilder: (BuildContext context, int index) {
          return buildListItem(context, qrCodeTypes[index]);
        },
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 3 / 2.2,
          maxCrossAxisExtent: 300,
        ),
      ),
    );
  }

  buildListItem(BuildContext ctx, QrType qrType) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(ctx, QrCreatePage.routeName, arguments: qrType.type);
      },
      // splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(Constants.rounded),
      child: WrapperCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: qrType.color,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Icon(qrType.icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 16),
            Text(qrType.name, style: Theme.of(ctx).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
