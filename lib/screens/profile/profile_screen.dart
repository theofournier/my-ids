import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/screens/settings/settings_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profile";

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
            SizedBox(height: 40,),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(SettingsScreen.routeName),
              leading: Icon(Icons.settings, color: Theme.of(context).primaryColor,),
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
            )
          ],
        ),
      ),
    );
  }
}

