import 'package:flutter/material.dart';
import '../sample_items.dart';

class SimpleListItem extends StatelessWidget {
  const SimpleListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SampleItemModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('SampleItem ${item.id}'),
      leading: const CircleAvatar(
        // Display the Flutter Logo image asset.
        foregroundImage: AssetImage('assets/images/flutter_logo.png'),
      ),
      onTap: () {
        // Navigate to the details page. If the user leaves and returns to
        // the app after it has been killed while running in the
        // background, the navigation stack is restored.
        Navigator.restorablePushNamed(
          context,
          SampleItemDetailsPage.routeName,
        );
      },
    );
  }
}
