import 'package:barcode_parser/barcode_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/providers.dart';

class AddToFav extends StatelessWidget {
  final Barcode qrcode;
  final String qrId;
  const AddToFav({Key? key, required this.qrcode, required this.qrId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, WidgetRef ref, child) {
      var favs = ref.watch(qrFavProvider);
      var isFav = favs.indexWhere((el) => el.id == qrId) > -1;
      return IconButton(
        onPressed: () {
          if (isFav) {
            ref.read(qrFavProvider.notifier).remove(id: qrId);
          } else {
            ref.read(qrFavProvider.notifier).add(qrcode.rawValue, qrcode.valueType, qrId);
          }
        },
        icon: Icon(isFav ? Icons.star : Icons.star_border_outlined),
      );
    });
  }
}
