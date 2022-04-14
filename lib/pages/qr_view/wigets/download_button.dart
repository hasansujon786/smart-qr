import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;
import '../../../ui/ui.dart';

class DownloadButton extends StatelessWidget {
  final String qrcodeRawValue;
  final Color fg;
  final Color bg;
  final Function onDownload;

  const DownloadButton(
    this.qrcodeRawValue, {
    Key? key,
    required this.fg,
    required this.bg,
    required this.onDownload,
  }) : super(key: key);

  void _onDownload(qrcodeRawValue, context) async {
    // FocusScopeNode currentFocus = FocusScope.of(context);
    // if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    //   currentFocus.focusedChild!.unfocus();
    // }

    // TODO: downloadQrAsPng makes the ui lag
    final success = await qr_tools.downloadQrAsPng(qrcodeRawValue, fg, bg) ?? false;
    onDownload(success);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Constants.verticalPadding),
      child: FatButton(
        text: 'Download',
        icon: Icons.download_rounded,
        onPressed: () async {
          _onDownload(qrcodeRawValue, context);
        },
      ),
    );
  }
}
