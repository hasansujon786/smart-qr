import 'package:flutter/material.dart';

import '../../../ui/ui.dart';

class ButtonsControlls extends StatefulWidget {
  final Function onToggleFlash;
  final VoidCallback onOpenGalery;
  const ButtonsControlls({
    Key? key,
    required this.onToggleFlash,
    required this.onOpenGalery,
  }) : super(key: key);

  @override
  _ButtonsControllsState createState() => _ButtonsControllsState();
}

class _ButtonsControllsState extends State<ButtonsControlls> {
  bool isFlashOn = false;

  @override
  Widget build(BuildContext context) {
    return GlassMorphism(
      borderRadius: 20,
      blur: 10,
      opacity: 0.2,
      child: SizedBox(
        width: 145,
        height: 48,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                setState(() => isFlashOn = !isFlashOn);
                widget.onToggleFlash(isFlashOn);
              },
              icon: Icon(isFlashOn ? Icons.flash_on : Icons.flash_off, color: Colors.white, size: 24),
            ),
            Text('|', style: TextStyle(color: Colors.white.withOpacity(0.1), fontSize: 22)),
            IconButton(
              onPressed: widget.onOpenGalery,
              icon: const Icon(Icons.image_outlined, color: Colors.white, size: 24),
            )
          ],
        ),
      ),
    );
  }
}
