import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/providers/auth_provider.dart';
import 'package:my_ids/screens/auth/widgets/code_widget.dart';
import 'package:my_ids/screens/auth/widgets/welcome_widget.dart';
import 'package:my_ids/screens/home/home_screen.dart';
import 'package:my_ids/theme.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  S.of(context).appTitle,
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                SizedBox(width: 20,),
                Image.asset(
                  "assets/images/logo_primary.png",
                  height: 50,
                  width: 50,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Expanded(
              child: CodeWidget(
                key: Key("LOGIN"),
                validator: (value) {
                  if (!Utils.isMasterCodeValid(value))
                    return S.of(context).errorMasterCodeInvalid;
                  if (!Provider.of<AuthProvider>(context, listen: false)
                      .checkPassword(value))
                    return S.of(context).errorMasterCodeWrong;
                  return null;
                },
                onDone: (password) {
                  Provider.of<AuthProvider>(context, listen: false)
                      .login();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
