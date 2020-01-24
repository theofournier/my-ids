import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';

class ConfirmationDialog {
  BuildContext context;
  AlertDialog alertDialog;

  ConfirmationDialog({BuildContext context, String title, String message}) {
    this.context = context;
    this.alertDialog = AlertDialog(
      title: title != null
          ? Text(
              title,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text(S.of(context).no.toUpperCase()),
          textColor: Theme.of(context).errorColor,
          onPressed: () => Navigator.of(context).pop(false),
        ),
        FlatButton(
          child: Text(S.of(context).yes.toUpperCase()),
          textColor: Theme.of(context).primaryColor,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }

  Future<bool> showConfirmationDialog() {
    return showDialog(context: context, builder: (ctx) => alertDialog);
  }
}
