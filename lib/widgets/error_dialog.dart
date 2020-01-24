import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';

class ErrorDialog {
  BuildContext context;
  AlertDialog alertDialog;

  ErrorDialog({BuildContext context, String title, String message}) {
    this.context = context;
    this.alertDialog = AlertDialog(
      title: title != null
          ? Text(
        title,
        style: TextStyle(
          color: Theme.of(context).errorColor,
          fontSize: 20,
          fontFamily: 'OpenSans',
          fontWeight: FontWeight.w600,
        ),
      )
          : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            color: Theme.of(context).errorColor,
            size: 50,
          ),
          Text(message),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(S.of(context).ok.toUpperCase()),
          textColor: Theme.of(context).accentColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }

  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (ctx) => alertDialog
    );
  }
}
