import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_ids/models/id_item_model.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/providers/bottom_bar_provider.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/screens/home/home_screen.dart';
import 'package:my_ids/theme.dart' as Theme;
import 'package:my_ids/routes.dart' as Routes;
import 'package:my_ids/utils/hive_keys.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<IdModel>(IdModelAdapter());
  Hive.registerAdapter<IdItemModel>(IdItemModelAdapter());
  final storage = FlutterSecureStorage();
  String encryptionKey = await storage.read(key: HiveKeys.encryptionKey);
  if(encryptionKey == null || encryptionKey.isEmpty){
    encryptionKey = String.fromCharCodes(Hive.generateSecureKey());
    await storage.write(key: HiveKeys.encryptionKey, value: encryptionKey);
  }
  await Hive.openBox(HiveKeys.idsBoxName, encryptionKey: Uint8List.fromList(encryptionKey.codeUnits));
  runApp(MyApp());
}

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
