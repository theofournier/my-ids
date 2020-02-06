import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';

class SwitchWidget extends StatelessWidget {
  final String title;
  final String information;
  final bool value;
  final Function onChanged;

  SwitchWidget({
    this.title,
    this.information,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Row(
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          if (information != null)
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        content: Text(
                          information,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(S.of(context).ok.toUpperCase()),
                            textColor: Theme.of(context).accentColor,
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.info_outline,
                  size: 20,
                ),
              ),
            ),
        ],
      ),
      contentPadding: const EdgeInsets.all(0),
      value: value,
      onChanged: onChanged,
    );
  }
}
