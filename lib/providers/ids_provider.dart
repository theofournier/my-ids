import 'package:flutter/material.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/utils/data_example.dart';
import 'package:my_ids/utils/utils.dart';

class IdsProvider with ChangeNotifier {
  List<IdModel> _ids = [];
  List<IdModel> _filteredIds = [];

  List<IdModel> get ids {
    return [..._ids];
  }

  List<IdModel> get filteredIds {
    return [..._filteredIds];
  }

  Future<void> fetchIds() async {
    await Utils.sleep(1);
    _ids = DataExample.ids;
    _filteredIds = DataExample.ids;
    notifyListeners();
  }

  void searchIds(String searchText) {
    if (searchText.isNotEmpty) {
      List<IdModel> tempList = [];
      for (int i = 0; i < _ids.length; i++) {
        if (_ids[i].title.toLowerCase().contains(searchText.toLowerCase())) {
          tempList.add(_ids[i]);
        }
      }
      _filteredIds = tempList;
    } else {
      _filteredIds = _ids;
    }
    notifyListeners();
  }

  void deleteId(String uid) {
    _ids.removeWhere((id) => id.uid == uid);
    _filteredIds.removeWhere((id) => id.uid == uid);
    notifyListeners();
  }
}
