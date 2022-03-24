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
          mainAxisSpacing: 3,
          crossAxisSpacing: 2,
          childAspectRatio: 3 / 2.4,
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
      color: qrType.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      elevation: 2,
      shadowColor: qrType.color,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, QrCreatePage.routeName, arguments: qrType.type);
        },
        borderRadius: BorderRadius.circular(radius),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 5),
            Icon(qrType.icon, color: Colors.white, size: 42),
            const SizedBox(height: 16),
            Text(
              qrType.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
