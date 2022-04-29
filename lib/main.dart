import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'models/models.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // set up hive
  await Hive.initFlutter();
  Hive.registerAdapter(QrHistoryAdapter());
  Hive.registerAdapter(QrFavAdapter());
  await Hive.openBox<QrHistory>(hiveBoxQrHistory);
  await Hive.openBox<QrFav>(hiveBoxQrFav);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const ProviderScope(
    child: MyApp(),
  ));
}
