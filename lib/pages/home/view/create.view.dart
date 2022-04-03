import 'package:flutter/material.dart';
import 'package:smart_qr/pages/home/home.dart';
import 'package:smart_qr/ui/widgets/qr_icon.dart';

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
      body: BottomNavBarPadding(
        child: GridView.builder(
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
            Text(
              qrType.name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Palette.text),
            ),
          ],
        ),
      ),
    );
  }
}
