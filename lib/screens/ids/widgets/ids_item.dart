import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/screens/id/id_screen.dart';
import 'package:my_ids/theme.dart';
import 'package:my_ids/utils/hex_color.dart';

class IdsItem extends StatelessWidget {
  final IdModel data;

  IdsItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = data.hexColor != null ? Colors.white : Theme.of(context).primaryColorDark;

    return GestureDetector(
      key: key,
      onTap: () => Navigator.of(context).pushNamed(IdScreen.routeName, arguments: data),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: data.hexColor != null ? HexColor(data.hexColor) : AppColors.greyBackgroundDark,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      data.title,
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: textColor,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      DateFormat.yMMMMd().format(data.updatedAt),
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
