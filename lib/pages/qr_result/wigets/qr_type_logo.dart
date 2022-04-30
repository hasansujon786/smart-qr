import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../models/models.dart';
import '../../../ui/ui.dart';

class QrTypeLogo extends StatelessWidget {
  final QrType qrType;
  const QrTypeLogo({Key? key, QrType? qrType})
      : qrType = qrType ?? unknownQrType,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 100,
      height: 100,
      child: WrapperCard(
        blurRadius: 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            QrIcon(
              color: qrType.color,
              icon: qrType.icon,
            ),
            const SizedBox(height: 6),
            FittedBox(
              child: Text(qrType.name, style: theme.textTheme.titleLarge?.copyWith(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
