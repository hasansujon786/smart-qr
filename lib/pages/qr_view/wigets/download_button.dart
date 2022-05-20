import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../../domain/qr_tools/qr_tools.dart' as qr_tools;

const double _minWidth = 50;

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
  bool _isAnimating = true;
  var _state = _ButtonState.init;

  void _download() async {
    setState(() => _state = _ButtonState.loading);
    // await Future.delayed(const Duration(seconds: 1), () => setState(() => _state = _ButtonState.success));
    // await Future.delayed(const Duration(seconds: 1), () => setState(() => _state = _ButtonState.init));
    Future.delayed(const Duration(milliseconds: 700), saveQrAsImg);
  }

  void saveQrAsImg() async {
    final success = await qr_tools.downloadQrAsPng(
      widget.qrcodeRawValue,
      fg: widget.fg,
      bg: widget.bg,
      albumName: appName,
    );
    setState(() => _state = _ButtonState.success);
    widget.onDownload(success ?? false);
    Future.delayed(const Duration(seconds: 2), () => setState(() => _state = _ButtonState.init));
  }

  @override
  Widget build(BuildContext context) {
    bool isStretched = _isAnimating || _state == _ButtonState.init;
    bool isDone = _state == _ButtonState.success;
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 85,
      width: width,
      alignment: Alignment.bottomCenter, // where to position the child
      padding: EdgeInsets.all(Constants.verticalPadding),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInCirc,
        width: _state == _ButtonState.init ? width : _minWidth,
        onEnd: () => setState(() => _isAnimating = !_isAnimating),
        child: isStretched
            ? _Btn(onPress: _download)
            : isDone
                ? _SmallBtn.success()
                : _SmallBtn.loading(context),
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  final VoidCallback onPress;
  const _Btn({Key? key, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        fixedSize: const Size.fromHeight(_minWidth),
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

class _SmallBtn extends StatelessWidget {
  final Widget child;
  final _ButtonState state;
  const _SmallBtn({Key? key, required this.child, this.state = _ButtonState.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _minWidth,
      width: _minWidth,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: state == _ButtonState.loading ? Theme.of(context).colorScheme.primary : Colors.green,
        shape: BoxShape.circle,
      ),
      child: Center(child: child),
    );
  }

  factory _SmallBtn.success() {
    return const _SmallBtn(
      state: _ButtonState.success,
      child: Icon(Icons.done, size: 28),
    );
  }

  factory _SmallBtn.loading(BuildContext context) {
    return _SmallBtn(
      state: _ButtonState.loading,
      child: CircularProgressIndicator(color: Theme.of(context).cardColor, strokeWidth: 2.5),
    );
  }
}

enum _ButtonState {
  init,
  loading,
  success,
}
