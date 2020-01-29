import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/providers/auth_provider.dart';
import 'package:my_ids/screens/auth/widgets/code_widget.dart';
import 'package:my_ids/screens/auth/widgets/welcome_widget.dart';
import 'package:my_ids/screens/home/home_screen.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = "/register";

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _activeTab = 0;
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_activeTab > 0)
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    _activeTab -= 1;
                  });
                },
              ),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_activeTab) {
      case 0:
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8.0,
          ),
          child: WelcomeWidget(
            onNext: () {
              setState(() {
                _activeTab += 1;
              });
            },
          ),
        );
      case 1:
        return CodeWidget(
          key: Key("1"),
          title: S.of(context).setMasterCode,
          validator: (value) {
            if (!Utils.isMasterCodeValid(value))
              return S.of(context).errorMasterCodeInvalid;
            return null;
          },
          onDone: (password) {
            setState(() {
              _password = password;
              _activeTab += 1;
            });
          },
        );
      case 2:
        return CodeWidget(
          key: Key("2"),
          title: S.of(context).confirmMasterCode,
          validator: (value) {
            if (!Utils.isMasterCodeValid(value))
              return S.of(context).errorMasterCodeInvalid;
            if (value != _password)
              return S.of(context).errorMasterCodeConfirmation;
            return null;
          },
          onDone: (password) {
            Provider.of<AuthProvider>(context, listen: false)
                .savePassword(password);
            Provider.of<AuthProvider>(context, listen: false)
                .login();
          },
        );
    }
    return Container();
  }
}
