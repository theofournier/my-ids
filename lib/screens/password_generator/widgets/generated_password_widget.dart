import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ids/generated/l10n.dart';

class GeneratedPasswordWidget extends StatelessWidget {
  final String generatedPassword;

  GeneratedPasswordWidget({this.generatedPassword});

  void onTapCopied(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    Clipboard.getData("text/plain").then((value) {
      Flushbar(
        message: "${S.of(context).copied} ${value.text}",
        duration: Duration(seconds: 3),
      )..show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: InkWell(
        onTap: () => this.onTapCopied(context, generatedPassword),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (generatedPassword != null && generatedPassword.isNotEmpty)
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    generatedPassword,
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.content_copy,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
