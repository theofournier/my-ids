import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_item_model.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/screens/edit_id/widgets/color_widget.dart';
import 'package:my_ids/screens/edit_id/widgets/id_item.dart';
import 'package:my_ids/screens/edit_id/widgets/note_widget.dart';
import 'package:my_ids/theme.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:my_ids/widgets/default_textformfield.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class EditIdScreen extends StatefulWidget {
  static const routeName = "/edit-id";

  @override
  _EditIdScreenState createState() => _EditIdScreenState();
}

class _EditIdScreenState extends State<EditIdScreen> {
  IdModel _data =
      IdModel(hexColor: Utils.getHexFromColor(AppColors.idColors[0]));

  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool _isInit = false;
  @override
  void didChangeDependencies() {
    if(!_isInit){
      IdModel idInit = ModalRoute.of(context).settings.arguments;
      if(idInit != null){
        _data = IdModel.fromJson(idInit.toJson());
      }
    }
    super.didChangeDependencies();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    String flushbarMessage = "";
    if(_data.uid != null){
      await Provider.of<IdsProvider>(context, listen: false).updateId(_data);
      flushbarMessage = S.of(context).idUpdated;
    } else {
      await Provider.of<IdsProvider>(context, listen: false).addId(_data);
      flushbarMessage = S.of(context).idAdded;
    }
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pop();
    Flushbar(
      message: flushbarMessage,
      duration: Duration(seconds: 3),
    )..show(context);
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
          _data.uid != null ? S.of(context).editId : S.of(context).newId,
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
                          initialValue: _data.title,
                          validator: (value) {
                            if (value.isEmpty)
                              return "${S.of(context).title} ${S.of(context).isRequired}";
                            return null;
                          },
                          onSaved: (value) => setState(() {
                            _data.title = value;
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
                            if (_data.items == null) {
                              _data.items = [];
                            }
                            setState(() {
                              _data.items.add(IdItemModel(uid: Uuid().v4()));
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        NoteWidget(
                          value: _data.note,
                          onSaved: (value) => _data.note = value,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ColorWidget(
                          hexColor: _data.hexColor,
                          callback: (String hexColor) => setState(() {
                            _data.hexColor = hexColor;
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
    return _data.items != null && _data.items.isNotEmpty
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _data.items
                .map(
                  (item) => IdItem(
                    key: Key(item.uid ?? Uuid().v4()),
                    idItemModel: item,
                    onDelete: () {
                      setState(() {
                        _data.items.remove(item);
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
