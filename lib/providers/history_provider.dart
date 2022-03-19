import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_qr/domain/qr_tools/qr_tools.dart';
import 'package:uuid/uuid.dart';

var _uuid = const Uuid();

final _sampleHistories = [
  QrHistory('qr 1', type: QrcodeValueType.sms),
  QrHistory('qr 2', type: QrcodeValueType.sms),
];

final qrHistoryProvider = StateNotifierProvider<QrHistoryNotifier, List<QrHistory>>((ref) {
  return QrHistoryNotifier(ref.read, _sampleHistories);
});

class QrHistoryNotifier extends StateNotifier<List<QrHistory>> {
  QrHistoryNotifier(this.read, [List<QrHistory>? state]) : super(state ?? <QrHistory>[]);

  final Reader read;

  void add(String raw, QrcodeValueType type) {
    state = [...state, QrHistory(raw, type: type)];
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

@immutable
class QrHistory {
  final String id;
  final String rawValue;
  final QrcodeValueType type;

  QrHistory(
    this.rawValue, {
    required this.type,
    String? id,
  }) : id = id ?? _uuid.v4();
}
