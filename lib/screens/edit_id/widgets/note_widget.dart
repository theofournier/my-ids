import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/widgets/default_textformfield.dart';

class NoteWidget extends StatelessWidget {
  final String value;
  final Function(String value) onSaved;

  NoteWidget({this.value, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
        child: DefaultTextFormField(
          labelText: S.of(context).note,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.none,
          initialValue: value,
          onSaved: onSaved,
          minLines: 5,
        ),
      ),
    );
  }
}

