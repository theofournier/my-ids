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
}
