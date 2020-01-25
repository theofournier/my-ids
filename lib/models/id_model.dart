import 'package:intl/intl.dart';

import 'package:my_ids/models/id_item_model.dart';

class IdModel {
  String uid;
  String title;
  List<IdItemModel> items;
  String note;
  String hexColor;
  DateTime createdAt;
  DateTime updatedAt;

  IdModel({
    this.uid,
    this.title,
    this.items,
    this.note,
    this.hexColor,
    this.createdAt,
    this.updatedAt,
  });

  IdModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        title = json['title'],
        note = json['note'],
        hexColor = json['hexColor'],
        createdAt = DateTime.parse(json["createdAt"]),
        updatedAt = DateTime.parse(json["updatedAt"]),
        items = json["items"] != null
            ? (json["items"] as List<Map>).map((item) => IdItemModel.fromJson(item)).toList()
            : null;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'title': title,
        'note': note,
        'hexColor': hexColor,
        'createdAt': DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(createdAt),
        'updatedAt': DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(updatedAt),
        'items': items != null ? items.map((item) => item.toJson()).toList() : null,
      };
}
