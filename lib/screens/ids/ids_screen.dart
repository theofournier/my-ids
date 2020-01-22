import 'package:flutter/material.dart';
import 'package:my_ids/generated/i18n.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/providers/ids_provider.dart';
import 'package:my_ids/screens/ids/widgets/ids_item.dart';
import 'package:my_ids/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class IdsScreen extends StatefulWidget {
  static const routeName = "/ids";

  @override
  _IdsScreenState createState() => _IdsScreenState();
}

class _IdsScreenState extends State<IdsScreen> {
  TextEditingController _searchController = TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      if (_searchController.text.isEmpty) {
        _searchText = "";
      } else {
        _searchText = _searchController.text;
      }
      //TODO filter
    });
    //TODO filter
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _refreshIds(BuildContext context) async {
    await Provider.of<IdsProvider>(context, listen: false).fetchIds();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
            child: SearchWidget(
              title: S.of(context).searchId,
              controller: _searchController,
            ),
          ),
          SizedBox(height: 20,),
          FutureBuilder(
            future: _refreshIds(context),
            builder: (ctx, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Expanded (
                child: RefreshIndicator(
                  onRefresh: () => _refreshIds(context),
                  child: Consumer<IdsProvider>(
                    builder: (ctx, idsProvider, _) {
                      return ListView.separated(
                        padding: const EdgeInsets.only(right: 30, left: 30, bottom: 20),
                        separatorBuilder: (ctx, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: idsProvider.ids.length,
                        itemBuilder: (ctx, index) {
                          IdModel item = idsProvider.ids[index];
                          return IdsItem(
                            key: Key(item.uid),
                            data: item,
                          );
                        },
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }


}
