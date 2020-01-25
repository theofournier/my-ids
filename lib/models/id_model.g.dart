// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'id_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IdModelAdapter extends TypeAdapter<IdModel> {
  @override
  final typeId = 0;

  @override
  IdModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IdModel(
      uid: fields[0] as String,
      title: fields[1] as String,
      items: (fields[2] as List)?.cast<IdItemModel>(),
      note: fields[3] as String,
      hexColor: fields[4] as String,
      createdAt: fields[5] as DateTime,
      updatedAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, IdModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.items)
      ..writeByte(3)
      ..write(obj.note)
      ..writeByte(4)
      ..write(obj.hexColor)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.updatedAt);
  }
}
