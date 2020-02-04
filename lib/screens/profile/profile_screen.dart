import 'package:flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/providers/auth_provider.dart';
import 'package:my_ids/screens/settings/settings_screen.dart';
import 'package:my_ids/screens/update_master_code/update_master_code_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _biometricEnable = false;

  @override
  void initState() {
    super.initState();
    _biometricEnable = Provider.of<AuthProvider>(context, listen: false)
        .checkBiometricEnable();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              S.of(context).profile,
              style: TextStyle(
                fontFamily: "Nunito",
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            if (!kIsWeb)
              SwitchListTile(
                title: Text(
                  S.of(context).profileBiometricSwitch,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                contentPadding: const EdgeInsets.all(0),
                value: _biometricEnable,
                onChanged: (value) async {
                  if (!await Provider.of<AuthProvider>(context, listen: false)
                      .checkBiometrics()) {
                    Flushbar(
                      message: S.of(context).errorBiometricsUnavailable,
                      duration: Duration(seconds: 5),
                    )..show(context);
                    return;
                  }
                  if (!value) {
                    Provider.of<AuthProvider>(context, listen: false)
                        .saveBiometricEnable(false);
                    setState(() {
                      _biometricEnable = false;
                    });
                  } else {
                    Provider.of<AuthProvider>(context, listen: false)
                        .authenticateBiometrics(
                      S.of(context).biometricsRequestDialog,
                      () => Flushbar(
                        message: S.of(context).errorBiometricsAuthentication,
                        duration: Duration(seconds: 5),
                      )..show(context),
                      () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .saveBiometricEnable(true);
                        setState(() {
                          _biometricEnable = true;
                        });
                      },
                    );
                  }
                },
                secondary: Icon(
                  Icons.fingerprint,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () => Navigator.of(context)
                  .pushNamed(UpdateMasterCodeScreen.routeName),
              leading: Icon(
                Icons.lock_outline,
                color: Theme.of(context).primaryColor,
              ),
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                S.of(context).updateMasterCode,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () =>
                  Navigator.of(context).pushNamed(SettingsScreen.routeName),
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor,
              ),
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                S.of(context).settings,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
