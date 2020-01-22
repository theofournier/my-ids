import 'package:flutter/material.dart';
import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/utils/data_example.dart';
import 'package:my_ids/utils/utils.dart';

class IdsProvider with ChangeNotifier {
  List<IdModel> _ids = [];

  List<IdModel> get ids {
    return [..._ids];
  }

  Future<void> fetchIds() async {
    await Utils.sleep(1);
    _ids = DataExample.ids;
    notifyListeners();
  }
}