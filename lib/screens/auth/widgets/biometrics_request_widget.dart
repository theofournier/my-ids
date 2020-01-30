import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class BiometricsRequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Text(
          S.of(context).biometricsRequestTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.fingerprint,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.face,
              color: Colors.white,
              size: 50,
            ),
          ],
        ),
        SizedBox(
          height: 100,
        ),
        RaisedButton(
          child: Text(
            S.of(context).accept,
            style: TextStyle(
              fontFamily: "OpenSans",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            Provider.of<AuthProvider>(context, listen: false).authenticateBiometrics(
              S.of(context).biometricsRequestDialog,
              () => Flushbar(
                message: S.of(context).errorBiometricsAuthentication,
                duration: Duration(seconds: 5),
              )..show(context),
              () {
                Provider.of<AuthProvider>(context, listen: false)
                    .saveBiometricEnable(true);
                Provider.of<AuthProvider>(context, listen: false).login();
              },
            );
          },
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side: BorderSide(
              color: Theme.of(context).accentColor,
              width: 2,
            ),
          ),
          elevation: 0,
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            Provider.of<AuthProvider>(context, listen: false)
                .saveBiometricEnable(false);
            Provider.of<AuthProvider>(context, listen: false)
                .login();
          },
          child: Text(
            S.of(context).skip,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          S.of(context).biometricsLater,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
