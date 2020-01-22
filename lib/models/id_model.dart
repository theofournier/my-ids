import 'package:my_ids/models/id_item_model.dart';

class IdModel {
  final String uid;
  final String title;
  final List<IdItemModel> items;
  final String note;
  final String hexColor;
  final DateTime createdAt;
  final DateTime updatedAt;

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
