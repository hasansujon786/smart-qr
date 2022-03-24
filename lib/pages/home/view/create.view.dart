import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
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
          return CreateItem(qrType: qrCodeTypes[index]);
        },
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 3 / 2.2,
          maxCrossAxisExtent: 300,
        ),
      ),
    );
  }
}

class CreateItem extends StatelessWidget {
  final QrType qrType;
  const CreateItem({
    Key? key,
    required this.qrType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Constants.borderRadius;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      elevation: Constants.cardElevation,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, QrCreatePage.routeName, arguments: qrType.type);
        },
        borderRadius: BorderRadius.circular(radius),
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
            Text(qrType.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
