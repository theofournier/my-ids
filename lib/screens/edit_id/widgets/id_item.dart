import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_item_model.dart';
import 'package:my_ids/widgets/confirmation_dialog.dart';
import 'package:my_ids/widgets/default_textformfield.dart';

class IdItem extends StatelessWidget {
  final IdItemModel idItemModel;
  final Function onDelete;

  IdItem({Key key, this.idItemModel, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: key,
      background: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
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
              size: 40,
            ),
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        onDelete();
      },
      confirmDismiss: (direction) {
        return ConfirmationDialog(
                context: context,
                title: S.of(context).confirmationDialogTitle,
                message: S.of(context).removeIdConfirmation)
            .showConfirmationDialog();
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DefaultTextFormField(
                labelText: S.of(context).name,
                initialValue: idItemModel.name,
                keyboardType: TextInputType.text,
                onSaved: (value) => idItemModel.name = value,
              ),
              DefaultTextFormField(
                labelText: S.of(context).id,
                initialValue: idItemModel.id,
                keyboardType: TextInputType.text,
                onSaved: (value) => idItemModel.id = value,
              ),
              DefaultTextFormField(
                labelText: S.of(context).password,
                initialValue: idItemModel.password,
                keyboardType: TextInputType.text,
                onSaved: (value) => idItemModel.password = value,
              ),
              DefaultTextFormField(
                labelText: S.of(context).note,
                initialValue: idItemModel.note,
                keyboardType: TextInputType.text,
                onSaved: (value) => idItemModel.note = value,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: Theme.of(context).errorColor,
                    ),
                    onPressed: () async {
                      bool res = await ConfirmationDialog(
                              context: context,
                              title: S.of(context).confirmationDialogTitle,
                              message: S.of(context).removeIdConfirmation)
                          .showConfirmationDialog();
                      if (res) onDelete();
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
