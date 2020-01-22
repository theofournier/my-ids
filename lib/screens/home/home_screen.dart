import 'package:flutter/material.dart';
import 'package:my_ids/generated/i18n.dart';
import 'package:my_ids/providers/bottom_bar_provider.dart';
import 'package:my_ids/screens/home/widgets/default_bottom_bar.dart';
import 'package:my_ids/screens/ids/ids_screen.dart';
import 'package:my_ids/widgets/rounded_line.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/home";

  Widget displayedWidget(BuildContext context, String routeName) {
    switch (routeName) {
      case IdsScreen.routeName:
        return IdsScreen();
      case "/profile":
        return Text("SETTINGS");
      case HomeScreen.routeName:
      default:
        return buildHomeScreen(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: DefaultBottomBar(),
      body: Consumer<BottomBarProvider>(
        builder: (ctx, bottomBar, ch) {
          return this.displayedWidget(context, bottomBar.currentRouteName);
        },
      ),
    );
  }

  Widget buildHomeScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 150),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            S.of(context).homeTitle,
            style: TextStyle(
              fontFamily: "Nunito",
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          RoundedLine(),
          SizedBox(
            height: 40,
          ),
          Text(
            S.of(context).homeText,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
