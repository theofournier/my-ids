import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/screens/id/widgets/id_item.dart';
import 'package:my_ids/utils/data_example.dart';
import 'package:my_ids/utils/hex_color.dart';

class IdScreen extends StatelessWidget {
  static const routeName = "/id";

  IdModel data = IdModel();

  void onTapCopied(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    Clipboard.getData("text/plain").then((value) {
      Flushbar(
        message:  "${S.of(context).copied} ${value.text}",
        duration:  Duration(seconds: 3),
      )..show(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.edit),
            tooltip: S.of(context).editId,
            onPressed: () => print("EDIT"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SelectableText(
                data.title,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: data.hexColor != null
                      ? HexColor(data.hexColor)
                      : Theme.of(context).primaryColorDark,
                ),
                onTap: () => onTapCopied(context, data.title),
              ),
              if (data.items != null && data.items.isNotEmpty)
                SizedBox(
                  height: 16,
                ),
              if (data.items != null && data.items.isNotEmpty)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: data.items
                      .map((item) => IdItem(
                    key: Key(item.uid),
                    data: item,
                    hexColor: data.hexColor,
                    onTapCopied: onTapCopied,
                  ))
                      .toList(),
                ),
              if (data.note != null && data.note.isNotEmpty)
                SizedBox(
                  height: 16,
                ),
              if (data.note != null && data.note.isNotEmpty)
                Card(
                  elevation: 2,
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: 80,
                      ),
                      child: SelectableText(
                        data.note,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        onTap: () => onTapCopied(context, data.note),
                      ),
                    ),
                  ),
                ),
              if (data.hexColor != null && data.hexColor.isNotEmpty)
                SizedBox(
                  height: 16,
                ),
              if (data.hexColor != null && data.hexColor.isNotEmpty)
                Card(
                  elevation: 0,
                  margin: const EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: HexColor(data.hexColor),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                    child: Text(
                      data.hexColor.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
