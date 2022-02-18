import 'package:flutter/material.dart';
import '../sample_items.dart';

/// Displays a list of SampleItems.
class SampleItemsPage extends StatelessWidget {
  const SampleItemsPage({
    Key? key,
    this.items = const [SampleItemModel(1), SampleItemModel(2), SampleItemModel(3)],
  }) : super(key: key);

  static const routeName = '/items';

  final List<SampleItemModel> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
      ),
      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return SimpleListItem(item: item);
        },
      ),
    );
  }
}
