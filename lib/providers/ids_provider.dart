import 'dart:convert';
import 'dart:io';

import 'package:downloads_path_provider/downloads_path_provider.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/utils/hive_keys.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:permission_handler/permission_handler.dart';
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

  Future<String> newId(IdModel data) async {
    data.uid = Uuid().v4();
    data.createdAt = DateTime.now();
    data.updatedAt = DateTime.now();
    _ids.add(data);
    await Hive.box(HiveKeys.idsBoxName).put(HiveKeys.idsKey, _ids);
    notifyListeners();
    return data.uid;
  }

  Future<void> insertId(int index, IdModel data) async {
    _ids.insert(index, data);
    await Hive.box(HiveKeys.idsBoxName).put(HiveKeys.idsKey, _ids);
    notifyListeners();
  }

  Future<List<IdModel>> addMultipleIds(List<IdModel> ids) async {
    await fetchIds();
    List<IdModel> temps = [];
    for(int i = 0; i < ids.length; i++){
      try{
        IdModel temp = _ids.firstWhere((id) => id.uid == ids[i].uid, orElse: () => null);
        if(temp != null){
          temps.add(temp);
        } else {
          _ids.add(ids[i]);
        }
      } catch(e){
        print(e);
      }
    }
    await Hive.box(HiveKeys.idsBoxName).put(HiveKeys.idsKey, _ids);
    notifyListeners();
    return temps;
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

  Future<bool> exportIds(List<String> uids) async{
    if(uids != null && uids.isNotEmpty) {
      try {
        String json = jsonEncode(
            uids.map((uid) => _ids.firstWhere((id) => id.uid == uid)).toList());
        File file = await Utils.writeFile(await Utils.getLocalFile("${(await DownloadsPathProvider.downloadsDirectory).path}/${"my_ids_exporting.json"}"), json);
        print(file);
        return true;
      } catch (e) {
        print(e);
        return false;
      }
    }
    return false;
  }

  Future<List<IdModel>> importIds(String filePath) async{
    if(filePath != null && filePath.isNotEmpty) {
      try {
        File file = await Utils.getLocalFile(filePath);
        String contents = await file.readAsString();
        List<dynamic> json = jsonDecode(contents);
        return json.map((id) => IdModel.fromJson(id)).toList();
      } catch (e) {
        print(e);
        return null;
      }
    }
    return null;
  }
}
