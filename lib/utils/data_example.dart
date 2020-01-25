import 'package:my_ids/models/id_model.dart';
import 'package:my_ids/models/id_item_model.dart';

class DataExample {
  static IdModel id1 = IdModel(
    uid: "id1",
    title: "Id1",
    note: "Ceci est une note",
    hexColor: "6e5773",
    createdAt: DateTime.parse("2020-01-21T10:30:00+0000"),
    updatedAt: DateTime.parse("2020-01-21T15:40:00+0000"),
    items: [
      IdItemModel(
        uid: "idItem1",
        name: "Nom 1",
        id: "Id 1",
        password: "Password 1",
        note: "Note 1"
      ),
      IdItemModel(
        uid: "idItem2",
          name: "Nom 2",
          id: "Id 2",
      ),
      IdItemModel(
          uid: "idItem3",
          password: "Password 3",
          note: "Note 3"
      ),
    ],
  );

  static IdModel id2 = IdModel(
    uid: "id2",
    title: "Id2",
    createdAt: DateTime.parse("2020-01-22T10:30:00+0000"),
    updatedAt: DateTime.parse("2020-01-22T15:40:00+0000"),
    items: [
      IdItemModel(
          uid: "idItem1",
          name: "Nom 1",
          id: "Id 1",
          password: "Password 1",
          note: "Note 1"
      ),
      IdItemModel(
        uid: "idItem2",
        name: "Nom 2",
        id: "Id 2",
      ),
      IdItemModel(
          uid: "idItem3",
          password: "Password 3",
          note: "Note 3"
      ),
    ],
  );
  static IdModel id3 = IdModel(
    uid: "id3",
    title: "Id3",
    hexColor: "#6a8caf",
    createdAt: DateTime.parse("2020-01-22T10:30:00+0000"),
    updatedAt: DateTime.parse("2020-01-22T15:40:00+0000"),
    items: [
      IdItemModel(
          uid: "idItem1",
          name: "Nom 1",
          id: "Id 1",
          password: "Password 1",
          note: "Note 1"
      ),
      IdItemModel(
        uid: "idItem2",
        name: "Nom 2",
        id: "Id 2",
      ),
      IdItemModel(
          uid: "idItem3",
          password: "Password 3",
          note: "Note 3"
      ),
    ],
  );
  static IdModel id4 = IdModel(
    uid: "id4",
    title: "Id4",
    hexColor: "ee8572",
    createdAt: DateTime.parse("2020-01-22T10:30:00+0000"),
    updatedAt: DateTime.parse("2020-01-22T15:40:00+0000"),
    items: [
      IdItemModel(
          uid: "idItem1",
          name: "Nom 1",
          id: "Id 1",
          password: "Password 1",
          note: "Note 1"
      ),
      IdItemModel(
        uid: "idItem2",
        name: "Nom 2",
        id: "Id 2",
      ),
      IdItemModel(
          uid: "idItem3",
          password: "Password 3",
          note: "Note 3"
      ),
    ],
  );

  static List<IdModel> ids = [id1, id2, id3, id4];
}