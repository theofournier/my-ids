import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/theme.dart';
import 'package:my_ids/utils/hex_color.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:my_ids/widgets/color_picker.dart';

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
                _buildColor(),
              ],
            )),
      ),
    );
  }

  Widget _buildColor() {
    return GestureDetector(
      onTap: () async {
        Color color = await showDialog(
          context: context,
          builder: (ctx) {
            return ColorPicker(
              colors: AppColors.idColors,
              initColor: _idModel.hexColor != null
                  ? HexColor(_idModel.hexColor)
                  : null,
            );
          },
        );
        setState(() {
          _idModel.hexColor = Utils.getHexFromColor(color);
        });
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: _idModel.hexColor != null
            ? HexColor(_idModel.hexColor)
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _idModel.hexColor == null
                  ? Text(
                      S.of(context).color,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                  : Text(
                      "#${_idModel.hexColor.toUpperCase()}",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
              Icon(
                Icons.edit,
                color: _idModel.hexColor != null ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
