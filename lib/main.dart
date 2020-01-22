import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_ids/theme.dart' as Theme;
import 'package:my_ids/routes.dart' as Routes;

import 'generated/i18n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: Theme.themeData,
      onGenerateTitle: (ctx) => S.of(ctx).appTitle,
      routes: Routes.routes,
      home: Center(child: Text(S.of(context).appTitle),),
    );
  }
}
