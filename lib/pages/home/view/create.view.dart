import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../pages/home/home.dart';
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
      body: BottomNavBarPadding(
        child: GridView.builder(
          itemCount: supportedCreateQrTypes.length,
          itemBuilder: (BuildContext context, int index) => CreateItem(qrType: supportedCreateQrTypes[index]),
          padding: const EdgeInsets.only(top: 12, right: 12, left: 12, bottom: 32),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisSpacing: 3,
            crossAxisSpacing: 2,
            childAspectRatio: 3 / 2.4,
            maxCrossAxisExtent: 300,
          ),
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
    final theme = Theme.of(context);

    return Card(
      // color: qrType.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
      elevation: 0.1,
      // shadowColor: qrType.color,
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
            QrIcon(color: qrType.color, icon: qrType.icon),
            const SizedBox(height: 16),
            Text(qrType.name, style: theme.textTheme.titleLarge?.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
