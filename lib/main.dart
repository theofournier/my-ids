import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_ids/models/id_item_model.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/models/password_generator_model.dart';
import 'package:my_ids/providers/auth_provider.dart';
import 'package:my_ids/providers/bottom_bar_provider.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/providers/password_generator_provider.dart';
import 'package:my_ids/screens/auth/login_screen.dart';
import 'package:my_ids/screens/auth/register_screen.dart';
import 'package:my_ids/screens/export_ids/export_ids_screen.dart';
import 'package:my_ids/screens/home/home_screen.dart';
import 'package:my_ids/screens/password_generator/password_generator_screen.dart';
import 'package:my_ids/screens/splash/splash_screen.dart';
import 'package:my_ids/theme.dart' as Theme;
import 'package:my_ids/routes.dart' as Routes;
import 'package:my_ids/utils/hive_keys.dart';
import 'package:provider/provider.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'generated/l10n.dart';

void main() async {
  Crashlytics.instance.enableInDevMode = true;
  FlutterError.onError = Crashlytics.instance.recordFlutterError;

  await Hive.initFlutter();
  Hive.registerAdapter<IdModel>(IdModelAdapter());
  Hive.registerAdapter<IdItemModel>(IdItemModelAdapter());
  Hive.registerAdapter<PasswordGeneratorModel>(PasswordGeneratorModelAdapter());
  String encryptionKey = String.fromCharCodes(Hive.generateSecureKey());
  if (kIsWeb) {
    Box box = await Hive.openBox(HiveKeys.keyBoxName);
    if(!box.containsKey(HiveKeys.encryptionKey)){
      box.put(HiveKeys.encryptionKey, encryptionKey);
    } else {
      encryptionKey = box.get(HiveKeys.encryptionKey);
    }
  } else if (Platform.isIOS || Platform.isAndroid) {
    final storage = FlutterSecureStorage();
    String temp = await storage.read(key: HiveKeys.encryptionKey);
    if (temp == null || temp.isEmpty) {
      await storage.write(key: HiveKeys.encryptionKey, value: encryptionKey);
    } else {
      encryptionKey = temp;
    }
  }
  await Hive.openBox(HiveKeys.idsBoxName,
      encryptionKey: Uint8List.fromList(encryptionKey.codeUnits));
  await Hive.openBox(HiveKeys.authBoxName,
      encryptionKey: Uint8List.fromList(encryptionKey.codeUnits));
  await Hive.openBox(HiveKeys.passwordGeneratorBoxName,
      encryptionKey: Uint8List.fromList(encryptionKey.codeUnits));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: BottomBarProvider()),
        ChangeNotifierProvider.value(value: IdsProvider()),
        ChangeNotifierProvider.value(value: AuthProvider()),
        ChangeNotifierProvider.value(value: PasswordGeneratorProvider()),
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
          home: HomeScreen(),/*Consumer<AuthProvider>(
            builder: (ctx, authProvider, _) {
              if (authProvider.isAuth) {
                return HomeScreen();
              }
              if (authProvider.password != null) {
                return LoginScreen();
              }
              return FutureBuilder(
                future: authProvider.retrievePassword(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SplashScreen();
                  }
                  return RegisterScreen();
                },
              );
            },
          ),*/
        ),
      ),
    );
  }
}
