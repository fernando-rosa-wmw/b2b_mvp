import 'dart:io';

import 'package:b2b_mvp/app_module.dart';
import 'package:b2b_mvp/app_widget.dart';
import 'package:b2b_mvp/firebase_options.dart';
import 'package:b2b_mvp/shared/data/hive_init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (!kIsWeb) {
    final Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  } else {
    Hive.init(null);
  }

  await HiveInit.initHive();

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
