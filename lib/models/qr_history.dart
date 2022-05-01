import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'qr_history.g.dart';

const String hiveBoxQrHistory = 'qr_histories';

var _uuid = const Uuid();

@immutable
@HiveType(typeId: 1)
class QrHistory {
  QrHistory({
    required this.rawValue,
    required this.type,
    DateTime? createdAt,
    String? id,
  })  : createdAt = createdAt ?? DateTime.now(),
        id = id ?? _uuid.v4();

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String rawValue;
  @HiveField(2)
  final String type;
  @HiveField(3)
  final DateTime createdAt;

  BarcodeValueType get typeAsEnum {
    return BarcodeValueType.values.firstWhere((e) => describeEnum(e) == type);
  }
}
