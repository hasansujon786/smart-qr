import 'package:flutter/material.dart';

/// Displays detailed information about a SampleItem.
class SampleItemDetailsPage extends StatelessWidget {
  const SampleItemDetailsPage({Key? key}) : super(key: key);

  static const routeName = '/item_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
