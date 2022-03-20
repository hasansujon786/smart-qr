import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';

final List<QrHistory> _sampleHistories = [];

final qrHistoryProvider = StateNotifierProvider<QrHistoryNotifier, List<QrHistory>>((ref) {
  return QrHistoryNotifier(ref.read, _sampleHistories);
});

class QrHistoryNotifier extends StateNotifier<List<QrHistory>> {
  QrHistoryNotifier(this.read, [List<QrHistory>? state]) : super(state ?? <QrHistory>[]);

  final Reader read;

  void add(String raw, BarcodeValueType type) {
    state = [QrHistory(type: type.name, rawValue: raw), ...state];
  }

  // void edit({required String id, required String description}) {
  //   state = [
  //     for (final todo in state)
  //       if (todo.id == id)
  //         QrHistory(
  //           description,
  //           id: todo.id,
  //           completed: todo.completed,
  //         )
  //       else
  //         todo,
  //   ];
  // }

  void remove(String id) {
    state = state.where((element) => element.id != id).toList();
  }
}
