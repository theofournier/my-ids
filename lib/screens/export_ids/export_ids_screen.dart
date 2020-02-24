import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

class ExportIdsScreen extends StatefulWidget {
  static const routeName = "/export-ids";

  @override
  _ExportIdsScreenState createState() => _ExportIdsScreenState();
}

class _ExportIdsScreenState extends State<ExportIdsScreen> {
  List<String> _selectedUids = [];

  void _onTapItem(String uid) {
    setState(() {
      if (_selectedUids.contains(uid)) {
        _selectedUids.remove(uid);
      } else {
        _selectedUids.add(uid);
      }
    });
  }

  void _onPressedAll() {
    List<String> temp = [];
    Provider.of<IdsProvider>(context, listen: false).ids.forEach((idModel) {
      temp.add(idModel.uid);
    });
    setState(() {
      _selectedUids = temp;
    });
  }

  void _onPressedNone() {
    setState(() {
      _selectedUids = [];
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
          S.of(context).exportIds,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          if (Provider.of<IdsProvider>(context, listen: false).ids.length ==
              _selectedUids.length)
            FlatButton(
              onPressed: _onPressedNone,
              child: Text(
                S.of(context).none,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          if (Provider.of<IdsProvider>(context, listen: false).ids.length !=
              _selectedUids.length)
            FlatButton(
              onPressed: _onPressedAll,
              child: Text(
                S.of(context).all,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          FutureBuilder(
            future: Provider.of<IdsProvider>(context, listen: false).fetchIds(),
            builder: (ctx, snapshot) {
              if (Provider.of<IdsProvider>(context, listen: false)
                      .ids
                      .isEmpty &&
                  snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Expanded(
                child: Consumer<IdsProvider>(builder: (ctx, idsProvider, _) {
                  if (idsProvider.ids.isEmpty) {
                    return Text(
                      S.of(context).noId,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    separatorBuilder: (ctx, index) => Divider(),
                    itemCount: idsProvider.ids.length,
                    itemBuilder: (ctx, index) {
                      IdModel temp = idsProvider.ids[index];
                      return ListTile(
                        key: Key(temp.uid),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 40,
                        ),
                        onTap: () => _onTapItem(temp.uid),
                        selected: _selectedUids.contains(temp.uid),
                        title: Text(temp.title),
                        trailing: _selectedUids.contains(temp.uid)
                            ? Icon(Icons.check_box)
                            : Icon(Icons.check_box_outline_blank),
                      );
                    },
                  );
                }),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "${_selectedUids.length} / ${Provider.of<IdsProvider>(context, listen: false).ids.length}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                RaisedButton(
                  child: Text(
                    S.of(context).export,
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    bool res = await Provider.of<IdsProvider>(context, listen: false)
                        .exportIds(_selectedUids);
                    if(res){
                      Flushbar(
                        message: S.of(context).exportIdsSuccess,
                        duration: Duration(seconds: 3),
                      )..show(context);
                    } else {
                      ErrorDialog(context: context, message: S.of(context).exportIdsError).showErrorDialog();
                    }
                  },
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 32.0),
                  color: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
