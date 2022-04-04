import 'package:flutter/material.dart';

import '../../../config/config.dart';
import '../../pages/home/home.dart';

class AppAboutDialog extends StatelessWidget {
  const AppAboutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: ListBody(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconTheme(data: Theme.of(context).iconTheme, child: const AppIcon()),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListBody(
                    children: <Widget>[
                      Text(appName, style: Theme.of(context).textTheme.headline5),
                      Text(appVersion, style: Theme.of(context).textTheme.bodyText2),
                      const SizedBox(height: 5),
                      // &copy; Think nXt Media 2021
                      Text('Think nXt Media', style: Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('CLOSE'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      scrollable: true,
    );
  }
}
