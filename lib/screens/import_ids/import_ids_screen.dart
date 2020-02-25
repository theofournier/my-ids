import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:my_ids/widgets/error_dialog.dart';
import 'package:provider/provider.dart';

class ImportIdsScreen extends StatefulWidget {
  static const routeName = "/import-ids";

  @override
  _ImportIdsScreenState createState() => _ImportIdsScreenState();
}

class _ImportIdsScreenState extends State<ImportIdsScreen> {
  List<IdModel> _importedIds = [];
  List<String> _selectedUids = [];

  bool _isLoading = false;

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
          S.of(context).importIds,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: _importedIds.isEmpty
            ? []
            : <Widget>[
                FlatButton(
                  onPressed: () => setState(() {_importedIds = [];}),
                  child: Text(
                    S.of(context).importIdsFile,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (_importedIds.length == _selectedUids.length)
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
                if (_importedIds.length != _selectedUids.length)
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_importedIds.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            RaisedButton(
              child: Text(
                S.of(context).selectFile,
                style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                String filePath = await Utils.pickFilePath(ext: "json");
                List<IdModel> temp =
                    await Provider.of<IdsProvider>(context, listen: false)
                        .importIds(filePath);
                setState(() {
                  _isLoading = false;
                });
                if (temp != null) {
                  setState(() {
                    this._importedIds = temp;
                  });
                } else {
                  ErrorDialog(
                          context: context,
                          message: S.of(context).importIdsError)
                      .showErrorDialog();
                }
              },
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 3,
            ),
          ],
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: _importedIds.isEmpty
              ? Text(
                  S.of(context).noId,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                )
              : ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  separatorBuilder: (ctx, index) => Divider(),
                  itemCount: _importedIds.length,
                  itemBuilder: (ctx, index) {
                    IdModel temp = _importedIds[index];
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
                ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "${_selectedUids.length} / ${_importedIds.length}",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RaisedButton(
                child: Text(
                  S.of(context).import,
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onPressed: _selectedUids.isEmpty
                    ? null
                    : () async {
                        setState(() {
                          _isLoading = true;
                        });
                        List<IdModel> temps = await Provider.of<IdsProvider>(
                                context,
                                listen: false)
                            .addMultipleIds(_selectedUids
                                .map((uid) => _importedIds
                                    .firstWhere((id) => id.uid == uid))
                                .toList());
                        setState(() {
                          _isLoading = false;
                        });
                        if (temps.isEmpty) {
                          Flushbar(
                            message: S.of(context).importIdsSuccess,
                            duration: Duration(seconds: 3),
                          )..show(context);
                        } else {
                          List<String> tempStr = [];
                          for (int i = 0; i < temps.length; i++) {
                            tempStr.add(temps[i].title);
                          }
                          ErrorDialog(
                            context: context,
                            title: S.of(context).importIdsErrorExists,
                            message: tempStr.join(", "),
                          ).showErrorDialog();
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
    );
  }
}
