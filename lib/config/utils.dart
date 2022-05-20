import 'package:date_format/date_format.dart';

String getDate(datetime) {
  return formatDate(datetime, [h, ':', nn, ' ', am, '  ', dd, '/', m, '/', yyyy]);
}
