import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/utils/data_example.dart';
import 'package:my_ids/utils/hive_keys.dart';
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
      ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
  }

  Future<void> fetchIds() async {
    List temp = await Hive.box(HiveKeys.idsBoxName)
        .get(HiveKeys.idsKey, defaultValue: []);
    _ids = [];
    temp.map((item){
      _ids.add(item);
    }).toList();
    _filteredIds = _ids;
    notifyListeners();
  }

  IdModel findByUid(String uid) {
    return _ids.firstWhere((id) => id.uid == uid, orElse: () => null);
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
    data.uid = Uuid().v4();
    data.createdAt = DateTime.now();
    data.updatedAt = DateTime.now();
    _ids.add(data);
    await Hive.box(HiveKeys.idsBoxName).put(HiveKeys.idsKey, _ids);
    notifyListeners();
  }

  Future<void> insertId(int index, IdModel data) async {
    _ids.insert(index, data);
    await Hive.box(HiveKeys.idsBoxName).put(HiveKeys.idsKey, _ids);
    notifyListeners();
  }

  Future<void> updateId(IdModel data) async {
    data.updatedAt = DateTime.now();
    int index = _ids.indexWhere((id) => id.uid == data.uid);
    _ids[index] = data;
    await Hive.box(HiveKeys.idsBoxName).put(HiveKeys.idsKey, _ids);
    notifyListeners();
  }

  Future<int> deleteId(String uid) async {
    int index = _ids.indexWhere((id) => id.uid == uid);
    _ids.removeAt(index);
    await Hive.box(HiveKeys.idsBoxName).put(HiveKeys.idsKey, _ids);
    notifyListeners();
    return index;
  }
}
