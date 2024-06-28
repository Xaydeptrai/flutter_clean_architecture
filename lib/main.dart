import 'package:flutter/material.dart';
import 'package:imdb/app/imdb_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imdb/core/di/di_container.dart';
import 'package:imdb_localization/strings.g.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initDi();
  runApp(
      TranslationProvider(
        child: const ImdbApp(),
    )
  );
}
