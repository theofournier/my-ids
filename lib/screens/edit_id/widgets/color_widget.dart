import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/utils/hex_color.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:my_ids/widgets/color_picker.dart';

import 'package:my_ids/theme.dart';

class ColorWidget extends StatelessWidget {
  final String hexColor;
  final Function(String hexColor) callback;

  ColorWidget({this.hexColor, this.callback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Color color = await showDialog(
          context: context,
          builder: (ctx) {
            return ColorPicker(
              colors: AppColors.idColors,
              initColor: hexColor != null
                  ? HexColor(hexColor)
                  : null,
            );
          },
        );
        callback(Utils.getHexFromColor(color));
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: hexColor != null
            ? HexColor(hexColor)
            : Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              hexColor == null
                  ? Text(
                S.of(context).color,
                style: TextStyle(
                  fontSize: 20,
                ),
              )
                  : Text(
                "#${hexColor.toUpperCase()}",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.edit,
                color: hexColor != null ? Colors.white : Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

