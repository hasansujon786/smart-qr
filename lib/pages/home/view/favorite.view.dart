import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../pages/qr_result/qr_result.dart';
import '../../../providers/providers.dart';
import '../widgets/widgets.dart';

class Favorite extends ConsumerWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var qrFavs = ref.watch(qrFavProvider).reversed.toList();
    var qrFavsController = ref.read(qrFavProvider.notifier);

    return QrListView(
      title: 'Favorites',
      qrList: qrFavs,
      qrListController: qrFavsController,
      onItemTap: (int index) {
        Navigator.pushNamed(context, QrHistoryDetailsPage.routeName, arguments: {
          'qr_id': qrFavs[index].id,
          'rawcode': qrFavs[index].rawValue,
          'is_fav_page': true,
        });
      },
    );
  }
}
