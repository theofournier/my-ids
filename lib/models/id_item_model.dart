import 'package:hive/hive.dart';

part 'id_item_model.g.dart';

@HiveType(typeId: 1)
class IdItemModel {
  @HiveField(0)
  final String uid;
  @HiveField(1)
  String name;
  @HiveField(2)
  String id;
  @HiveField(3)
  String password;
  @HiveField(4)
  String note;

  IdItemModel({
    this.uid,
    this.name,
    this.id,
    this.password,
    this.note,
  });

  IdItemModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        name = json['name'],
        id = json['id'],
        password = json['password'],
        note = json["note"];

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'name': name,
    'id': id,
    'password': password,
    'note': note,
  };
}
