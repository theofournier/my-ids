import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_item_model.dart';
import 'package:my_ids/utils/hex_color.dart';

class IdItem extends StatelessWidget {
  final IdItemModel data;
  final String hexColor;
  final Function(BuildContext context, String text) onTapCopied;

  IdItem({
    Key key,
    this.data,
    this.hexColor,
    this.onTapCopied,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: hexColor != null ? HexColor(hexColor) : Colors.black,
        ),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (data.name != null && data.name.isNotEmpty)
              _buildCopiedWidget(context, data.name),
            if (data.id != null && data.id.isNotEmpty)
              _buildCopiedWidget(context, data.id),
            if (data.password != null && data.password.isNotEmpty)
              _buildCopiedWidget(context, data.password),
            if (data.note != null && data.note.isNotEmpty)
              _buildCopiedWidget(context, data.note),
          ],
        ),
      ),
    );
  }

  Widget _buildCopiedWidget(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SelectableText(
        text,
        style: TextStyle(
          fontSize: 18,
        ),
        onTap: () => onTapCopied(context, text),
      ),
    );
  }
}
