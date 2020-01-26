import 'package:flutter/material.dart';
import 'package:my_ids/providers/auth_provider.dart';
import 'package:my_ids/screens/auth/widgets/welcome_widget.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  static const routeName = "/auth";

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int activeTab = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).retrievePassword();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8.0,
          ),
          child: Consumer<AuthProvider>(
            builder: (ctx, authProvider, _) {
              return _buildContent(authProvider.password);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String password) {
    if (password == null) {
      switch(activeTab) {
        case 0:
          return WelcomeWidget(onNext: () {
            setState(() {
              activeTab += 1;
            });
          },);
        case 1:
          return Text("SET");
        case 2:
          return Text("CONFIRM");
      }
    }
    return Text("LOGIN");
  }
}
