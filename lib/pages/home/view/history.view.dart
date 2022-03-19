import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_qr/domain/qr_tools/qr_tools.dart';
import 'package:smart_qr/providers/history_provider.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final qrHistories = ref.watch(qrHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HistoryView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Text(qrHistories[index].rawValue);
        },
        itemCount: qrHistories.length,
        // qrHistories.cou
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(qrHistoryProvider.notifier).add('sdfsfsdf', QrcodeValueType.sms);
      }),
    );
  }
}
