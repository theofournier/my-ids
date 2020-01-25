import 'package:flutter/material.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/utils/data_example.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:uuid/uuid.dart';

class IdsProvider with ChangeNotifier {
  List<IdModel> _ids = [];
  List<IdModel> _filteredIds = [];

  List<IdModel> get ids {
    return [..._ids];
  }

  List<IdModel> get filteredIds {
    return [..._filteredIds]
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt))
      ;
  }

  Future<void> fetchIds() async {
    await Utils.sleep(1);
    _ids = DataExample.ids;
    _filteredIds = DataExample.ids;
    notifyListeners();
  }

  IdModel findByUid(String uid) {
    return _ids.firstWhere((id) => id.uid == uid);
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

  Future<void> addId(IdModel data) async {
    await Utils.sleep(1);
    data.uid = Uuid().v4();
    data.createdAt = DateTime.now();
    data.updatedAt = DateTime.now();
    _ids.add(data);
    notifyListeners();
  }

  Future<void> updateId(IdModel data) async {
    await Utils.sleep(1);
    data.updatedAt = DateTime.now();
    int index = _ids.indexWhere((id) => id.uid == data.uid);
    _ids[index] = data;
    notifyListeners();
  }

  void deleteId(String uid) {
    _ids.removeWhere((id) => id.uid == uid);
    notifyListeners();
  }
}
