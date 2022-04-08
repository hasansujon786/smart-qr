import 'package:flutter/material.dart';

import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../ui/ui.dart';

class DownloadButton extends StatelessWidget {
  final String qrcodeRawValue;
  final Color fg;
  final Color bg;
  const DownloadButton(
    this.qrcodeRawValue, {
    Key? key,
    required this.fg,
    required this.bg,
  }) : super(key: key);

  void _onDownload(qrcodeRawValue, context) async {
    // FocusScopeNode currentFocus = FocusScope.of(context);
    // if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    //   currentFocus.focusedChild!.unfocus();
    // }

    // TODO: downloadQrAsPng makes the ui lag
    final success = await qr_tools.downloadQrAsPng(qrcodeRawValue, fg, bg) ?? false;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: success ? const Text('Image saved to Gallery') : const Text('Error saving image'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return FatButton(
      text: 'Download',
      icon: Icons.download_rounded,
      onPressed: () async {
        _onDownload(qrcodeRawValue, context);
      },
    );
  }
}
