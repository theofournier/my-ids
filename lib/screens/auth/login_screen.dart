import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/providers/auth_provider.dart';
import 'package:my_ids/screens/auth/widgets/code_widget.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isBiometricsEnable = false;

  @override
  void initState() {
    super.initState();
    _isBiometricsEnable = Provider.of<AuthProvider>(context, listen: false)
        .checkBiometricEnable();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColorLight,
              Theme.of(context).primaryColor,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0, 1],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    S.of(context).appTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/images/logo_white.png",
                    height: 50,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              Expanded(
                child: CodeWidget(
                  key: Key("LOGIN"),
                  endSpacing: !_isBiometricsEnable,
                  validator: (value) {
                    if (!Utils.isMasterCodeValid(value))
                      return S.of(context).errorMasterCodeInvalid;
                    if (!Provider.of<AuthProvider>(context, listen: false)
                        .checkPassword(value))
                      return S.of(context).errorMasterCodeWrong;
                    return null;
                  },
                  onDone: (password) {
                    Provider.of<AuthProvider>(context, listen: false).login();
                  },
                ),
              ),
              if (_isBiometricsEnable)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: FutureBuilder(
                    future: Provider.of<AuthProvider>(context, listen: false)
                        .availableBiometrics(),
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        IconData icon = Icons.fingerprint;
                        if(snapshot.data.contains(BiometricType.face)){
                          icon = Icons.face;
                        }
                        return IconButton(
                          onPressed: () {
                            Provider.of<AuthProvider>(context, listen: false)
                                .authenticateBiometrics(
                              S.of(context).biometricsRequestDialog,
                                  () => Flushbar(
                                message: S.of(context).errorBiometricsAuthentication,
                                duration: Duration(seconds: 5),
                              )..show(context),
                                  () {
                                Provider.of<AuthProvider>(context, listen: false)
                                    .login();
                              },
                            );
                          },
                          icon: Icon(
                            icon,
                            color: Theme.of(context).accentColor,
                            size: 40,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
