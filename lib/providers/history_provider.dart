import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

final qrHistoryProvider = StateNotifierProvider<QrHistoryNotifier, List<QrHistory>>((ref) {
  final box = Hive.box<QrHistory>(hiveBoxQrHistory);
  var _items = box.values.toList();
  return QrHistoryNotifier(ref, _items);
});

class QrHistoryNotifier extends StateNotifier<List<QrHistory>> {
  final Ref ref;
  QrHistoryNotifier(this.ref, [List<QrHistory>? state]) : super(state ?? <QrHistory>[]);

  final box = Hive.box<QrHistory>(hiveBoxQrHistory);

  void add(QrHistory qrHistory) {
    // final isSupporTedType = qrCodeTypes.indexWhere((element) => element.type == qrHistory.typeAsEnum) > -1;
    // if (!isSupporTedType) {
    //   print('================== unsupported qr type =====================');
    //   return;
    // }
    state = [...state, qrHistory];
    box.add(qrHistory);
  }

  void clear() {
    state = [];
    box.clear();
  }

  void remove({required String id, required int index}) {
    // state = state.where((element) => element.id != id).toList();
    state.removeAt(index);
    state = [...state];
    box.deleteAt(index);
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

}
