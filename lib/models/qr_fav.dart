import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'qr_fav.g.dart';

const String hiveBoxQrFav = 'qr_favs';


@immutable
@HiveType(typeId: 2)
class QrFav {
  QrFav({
    required this.rawValue,
    required this.type,
    required this.id,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

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
