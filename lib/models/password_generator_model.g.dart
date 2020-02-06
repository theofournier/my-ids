// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_generator_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PasswordGeneratorModelAdapter
    extends TypeAdapter<PasswordGeneratorModel> {
  @override
  final typeId = 2;

  @override
  PasswordGeneratorModel read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PasswordGeneratorModel(
      length: fields[0] as int,
      isWithSymbols: fields[1] as bool,
      isWithNumbers: fields[2] as bool,
      isWithLowercase: fields[3] as bool,
      isWithUppercase: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PasswordGeneratorModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.length)
      ..writeByte(1)
      ..write(obj.isWithSymbols)
      ..writeByte(2)
      ..write(obj.isWithNumbers)
      ..writeByte(3)
      ..write(obj.isWithLowercase)
      ..writeByte(4)
      ..write(obj.isWithUppercase);
  }
}
