import 'package:hive/hive.dart';

part 'password_generator_model.g.dart';

@HiveType(typeId: 2)
class PasswordGeneratorModel {
  static const INIT_LENGTH = 15;
  static const MAX_LENGTH = 30;

  @HiveField(0)
  int length;
  @HiveField(1)
  bool isWithSymbols;
  @HiveField(2)
  bool isWithNumbers;
  @HiveField(3)
  bool isWithLowercase;
  @HiveField(4)
  bool isWithUppercase;

  PasswordGeneratorModel({
    this.length = INIT_LENGTH,
    this.isWithSymbols = true,
    this.isWithNumbers = true,
    this.isWithLowercase = true,
    this.isWithUppercase = true,
  });

  PasswordGeneratorModel.fromJson(Map<String, dynamic> json)
      : length = json['length'],
        isWithSymbols = json['isWithSymbols'],
        isWithNumbers = json['isWithNumbers'],
        isWithLowercase = json['isWithLowercase'],
        isWithUppercase = json["isWithUppercase"];

  Map<String, dynamic> toJson() => {
        'length': length,
        'isWithSymbols': isWithSymbols,
        'isWithNumbers': isWithNumbers,
        'isWithLowercase': isWithLowercase,
        'isWithUppercase': isWithUppercase,
      };
}
