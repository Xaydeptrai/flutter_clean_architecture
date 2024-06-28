import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:imdb/app/navigation/app_route_config.dart';
import 'package:imdb_localization/strings.g.dart';

class ImdbApp extends StatefulWidget {
  const ImdbApp({super.key});

  @override
  State<ImdbApp> createState() => _ImdbAppState();
}

class _ImdbAppState extends State<ImdbApp> {
  final _appRouterConfig = AppRouteConfig();

  @override
  void dispose() {
    _appRouterConfig.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouterConfig.router,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: const[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
  
}
