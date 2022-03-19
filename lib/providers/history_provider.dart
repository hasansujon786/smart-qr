import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

var _uuid = const Uuid();

final List<QrHistory> _sampleHistories = [];

final qrHistoryProvider = StateNotifierProvider<QrHistoryNotifier, List<QrHistory>>((ref) {
  return QrHistoryNotifier(ref.read, _sampleHistories);
});

class QrHistoryNotifier extends StateNotifier<List<QrHistory>> {
  QrHistoryNotifier(this.read, [List<QrHistory>? state]) : super(state ?? <QrHistory>[]);

  final Reader read;

  void add(String raw, BarcodeValueType type) {
    state = [QrHistory(raw, type: type), ...state];
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
  final BarcodeValueType type;
  final DateTime createdAt;

  QrHistory(
    this.rawValue, {
    required this.type,
    DateTime? createdAt,
    String? id,
  })  : createdAt = createdAt ?? DateTime.now(),
        id = id ?? _uuid.v4();
}
