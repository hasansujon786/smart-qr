import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QrResultPage extends StatelessWidget {
  const QrResultPage({Key? key}) : super(key: key);
  static const routeName = '/qr_result';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    final code = args['code'] ?? '';
    final format = args['format'] ?? '';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(color: Colors.grey.shade400, blurRadius: 3),
                    ],
                  ),
                  width: 100,
                  height: 100,
                  child: const Center(child: Text('QR', style: TextStyle(fontSize: 32))),
                ),
                const SizedBox(height: 52),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(code, style: const TextStyle(fontSize: 15)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(format, style: const TextStyle(fontSize: 15)),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            width: double.infinity,
            // color: Colors.red,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code)).then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Text copied'),
                      duration: Duration(seconds: 3),
                    ),
                  );
                });
              },
              child: const Text('Copy Text', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
