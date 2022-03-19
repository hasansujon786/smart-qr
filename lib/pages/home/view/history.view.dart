import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_qr/pages/home/home.dart';
import 'package:smart_qr/providers/providers.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrHistories = ref.watch(qrHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: qrHistories.length,
          itemBuilder: (BuildContext context, int index) {
            return QrHistoryItem(history: qrHistories[index]);
          },
        ),
      ),
    );
  }
}
