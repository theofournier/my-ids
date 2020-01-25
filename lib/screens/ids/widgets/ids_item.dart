import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/screens/id/id_screen.dart';
import 'package:my_ids/theme.dart';
import 'package:my_ids/utils/hex_color.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:my_ids/widgets/confirmation_dialog.dart';
import 'package:provider/provider.dart';

class IdsItem extends StatelessWidget {
  final IdModel data;
  final Function(int index, IdModel data) undoFlushbar;

  IdsItem({Key key, this.data, this.undoFlushbar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color textColor = data.hexColor != null ? Colors.white : Theme.of(context).primaryColorDark;

    return Dismissible(
      key: key,
      background: Card(
        elevation: 2,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Theme.of(context).errorColor,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) async{
        IdModel temp = IdModel.fromJson(data.toJson());
        int index =
        await Provider.of<IdsProvider>(context, listen: false).deleteId(data.uid);
        undoFlushbar(index, temp);
      },
      child: GestureDetector(
        onTap: () async{
          dynamic res = await Navigator.of(context).pushNamed(IdScreen.routeName, arguments: data.uid);
          if(res != null)
            undoFlushbar(res["index"], res["data"]);
        } ,
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
                        getDateFormat(),
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
      ),
    );
  }

  String getDateFormat(){
    if(Utils.isToday(data.updatedAt)){
      return DateFormat.jm().format(data.updatedAt);
    }
    return DateFormat.yMMMMd().format(data.updatedAt);
  }
}
