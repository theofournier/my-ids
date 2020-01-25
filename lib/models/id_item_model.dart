class IdItemModel {
  final String uid;
  String name;
  String id;
  String password;
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
