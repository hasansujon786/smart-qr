import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;

class DownloadButton extends StatefulWidget {
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

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  final double _minWidth = 50;
  bool _isLoading = false;
  bool _isAnimating = false;

  void _download() {
    setState(() {
      _isLoading = true;
      _isAnimating = true;
    });

    // Future.delayed(const Duration(seconds: 1), () => setState(() => _isLoading = false));
    Future.delayed(const Duration(milliseconds: 700), saveQrAsImg);
  }

  void saveQrAsImg() async {
    final success = await qr_tools.downloadQrAsPng(widget.qrcodeRawValue, widget.fg, widget.bg) ?? false;
    widget.onDownload(success);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    bool _isStretched = _isAnimating || !_isLoading;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 85,
      width: width,
      alignment: Alignment.bottomCenter, // where to position the child
      padding: EdgeInsets.all(Constants.verticalPadding),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOutCirc,
        width: _isLoading ? _minWidth : width,
        onEnd: () => setState(() => _isAnimating = false),
        child: _isStretched ? buildBtn(_download) : buildLoading(),
      ),
    );
  }

  Widget buildLoading() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: SizedBox(
          width: 26,
          height: 26,
          child: CircularProgressIndicator(color: Theme.of(context).cardColor, strokeWidth: 2.5),
        ),
      ),
    );
  }

  Widget buildBtn(VoidCallback onPress) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(_minWidth),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.borderRadius)),
      ),
      child: FittedBox(
        child: Row(
          children: const [
            Icon(Icons.download_rounded),
            SizedBox(width: 8),
            Text('Download', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
