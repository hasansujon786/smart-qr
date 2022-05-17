import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/models.dart';

final qrFavProvider = StateNotifierProvider<QrFavNotifier, List<QrFav>>((ref) {
  final box = Hive.box<QrFav>(hiveBoxQrFav);
  var _items = box.values.toList();
  return QrFavNotifier(ref, _items);
});

class QrFavNotifier extends StateNotifier<List<QrFav>> {
  final Ref ref;
  QrFavNotifier(this.ref, [List<QrFav>? state]) : super(state ?? <QrFav>[]);

  final box = Hive.box<QrFav>(hiveBoxQrFav);

  void add(String raw, BarcodeValueType type, String id) {
    // final isSupporTedType = qrCodeTypes.indexWhere((element) => element.type == type) > -1;
    // if (!isSupporTedType) {
    //   print('================== unsupported qr type =====================');
    //   return;
    // }
    final newQr = QrFav(type: type.name, rawValue: raw, id: id);
    state = [...state, newQr];
    box.add(newQr);
  }

  void clear() {
    state = [];
    box.clear();
  }

  void remove({required String id}) {
    var foundIndex = box.values.toList().indexWhere((element) => element.id == id);
    if (foundIndex > -1) {
      box.deleteAt(foundIndex);
    }
    state = state.where((element) => element.id != id).toList();
  }

  // void edit({required String id, required String description}) {
  //   state = [
  //     for (final todo in state)
  //       if (todo.id == id)
  //         QrFav(
  //           description,
  //           id: todo.id,
  //           completed: todo.completed,
  //         )
  //       else
  //         todo,
  //   ];
  // }

}
