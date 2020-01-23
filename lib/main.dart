import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_ids/providers/bottom_bar_provider.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/screens/home/home_screen.dart';
import 'package:my_ids/screens/id/id_screen.dart';
import 'package:my_ids/screens/splash/splash_screen.dart';
import 'package:my_ids/theme.dart' as Theme;
import 'package:my_ids/routes.dart' as Routes;
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: BottomBarProvider()),
        ChangeNotifierProvider.value(value: IdsProvider()),
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: MaterialApp(
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
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
