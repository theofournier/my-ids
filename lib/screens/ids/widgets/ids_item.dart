import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/screens/id/id_screen.dart';
import 'package:my_ids/theme.dart';
import 'package:my_ids/utils/hex_color.dart';
import 'package:my_ids/widgets/confirmation_dialog.dart';
import 'package:provider/provider.dart';

class IdsItem extends StatelessWidget {
  final IdModel data;

  IdsItem({Key key, this.data}) : super(key: key);

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
      onDismissed: (_) {
        Provider.of<IdsProvider>(context, listen: false).deleteId(data.uid);
      },
      confirmDismiss: (direction) {
        return ConfirmationDialog(
            context: context,
            title: S.of(context).confirmationDialogTitle,
            message: S.of(context).removeIdConfirmation)
            .showConfirmationDialog();
      },
      child: GestureDetector(
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
      ),
    );
  }
}
