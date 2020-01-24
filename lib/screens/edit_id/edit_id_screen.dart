import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_item_model.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/screens/edit_id/widgets/color_widget.dart';
import 'package:my_ids/screens/edit_id/widgets/id_item.dart';
import 'package:my_ids/screens/edit_id/widgets/note_widget.dart';
import 'package:my_ids/theme.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:my_ids/widgets/default_textformfield.dart';
import 'package:uuid/uuid.dart';

class EditIdScreen extends StatefulWidget {
  static const routeName = "/edit-id";

  @override
  _EditIdScreenState createState() => _EditIdScreenState();
}

class _EditIdScreenState extends State<EditIdScreen> {
  IdModel _idModel = IdModel(hexColor: Utils.getHexFromColor(AppColors.idColors[0]));

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    //TODO save id
    await Utils.sleep(1);
    print("TITLE ${_idModel.title}");
    print("NOTE ${_idModel.note}");
    print("HEXCOLOR ${_idModel.hexColor}");
    if (_idModel.items != null && _idModel.items.isNotEmpty) {
      for (int i = 0; i < _idModel.items.length; i++) {
        print("$i NAME ${_idModel.items[i].name}");
        print("$i ID ${_idModel.items[i].id}");
        print("$i PASS ${_idModel.items[i].password}");
        print("$i NOTE ${_idModel.items[i].note}");
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          _idModel.uid != null ? S.of(context).editId : S.of(context).newId,
          style: TextStyle(color: Colors.black, fontFamily: "Nunito"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.done,
              color: Theme.of(context).primaryColor,
            ),
            tooltip: S.of(context).save,
            onPressed: () => _submit(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (_isLoading)
                  Center(
                    child: const CircularProgressIndicator(),
                  )
                else
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        DefaultTextFormField(
                          labelText: S.of(context).title,
                          keyboardType: TextInputType.text,
                          initialValue: _idModel.title,
                          onSaved: (value) => setState(() {
                            _idModel.title = value;
                          }),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildIdItemList(),
                        IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: Theme.of(context).accentColor,
                          ),
                          onPressed: () {
                            if (_idModel.items == null) {
                              _idModel.items = [];
                            }
                            setState(() {
                              _idModel.items.add(IdItemModel(uid: Uuid().v4()));
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        NoteWidget(
                          value: _idModel.note,
                          onSaved: (value) => _idModel.note = value,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ColorWidget(
                          hexColor: _idModel.hexColor,
                          callback: (String hexColor) => setState(() {
                            _idModel.hexColor = hexColor;
                          }),
                        ),
                      ],
                    ),
                  ),
              ],
            )),
      ),
    );
  }

  Widget _buildIdItemList() {
    return _idModel.items != null && _idModel.items.isNotEmpty
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _idModel.items
                .map(
                  (item) => IdItem(
                    key: Key(item.uid ?? Uuid().v4()),
                    idItemModel: item,
                    onDelete: () {
                      setState(() {
                        _idModel.items.remove(item);
                      });
                    },
                  ),
                )
                .toList(),
          )
        : Text(
            S.of(context).addIdItem,
            style: TextStyle(color: Theme.of(context).accentColor),
          );
  }
}
