import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';

class WelcomeWidget extends StatelessWidget {
  final Function onNext;

  WelcomeWidget({this.onNext});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/logo_white.png",
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${S.of(context).welcomeOn} ${S.of(context).appTitle}",
          style: TextStyle(
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          S.of(context).firstEnterMasterCode,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          S.of(context).warningMasterCode,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FlatButton(
              onPressed: onNext,
              child: Row(
                children: <Widget>[
                  Text(S.of(context).next.toUpperCase(), style: TextStyle(color: Theme.of(context).accentColor),),
                  SizedBox(width: 8,),
                  Icon(Icons.arrow_forward, color: Theme.of(context).accentColor,),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
