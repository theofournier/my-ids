// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_item_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IdItemModelAdapter extends TypeAdapter<IdItemModel> {
  @override
  final typeId = 1;

  @override
  IdItemModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IdItemModel(
      uid: fields[0] as String,
      name: fields[1] as String,
      id: fields[2] as String,
      password: fields[3] as String,
      note: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, IdItemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.note);
  }
}
