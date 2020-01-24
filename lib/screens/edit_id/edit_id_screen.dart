import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/screens/edit_id/widgets/color_widget.dart';

class EditIdScreen extends StatefulWidget {
  static const routeName = "/edit-id";

  @override
  _EditIdScreenState createState() => _EditIdScreenState();
}

class _EditIdScreenState extends State<EditIdScreen> {
  IdModel _idModel = IdModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          _idModel.uid != null ? S.of(context).editId : S.of(context).newId,
          style: TextStyle(color: Colors.black, fontFamily: "Nunito"),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("TITLE"),
                Text("IDS"),
                Text("NOTE"),
                ColorWidget(
                  hexColor: _idModel.hexColor,
                  callback: (String hexColor) => setState(() {
                    _idModel.hexColor = hexColor;
                  }),
                ),
              ],
            )),
      ),
    );
  }
}
