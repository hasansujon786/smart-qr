import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var _uuid = const Uuid();

@immutable
class QrHistory {
  QrHistory(
    this.rawValue, {
    required this.type,
    DateTime? createdAt,
    String? id,
  })  : createdAt = createdAt ?? DateTime.now(),
        id = id ?? _uuid.v4();

  final String id;
  final String rawValue;
  final BarcodeValueType type;
  final DateTime createdAt;
}
