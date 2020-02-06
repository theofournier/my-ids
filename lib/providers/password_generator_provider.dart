import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:my_ids/models/password_generator_model.dart';
import 'package:my_ids/utils/hive_keys.dart';
import 'package:my_ids/utils/utils.dart';

class PasswordGeneratorProvider with ChangeNotifier {
  String _generatedPassword;
  PasswordGeneratorModel _passwordGeneratorModel;

  String get generatedPassword {
    if (_generatedPassword == null) {
      _generatedPassword = Hive.box(HiveKeys.passwordGeneratorBoxName)
          .get(HiveKeys.generatedPasswordKey);
    }
    return _generatedPassword;
  }

  PasswordGeneratorModel get passwordGeneratorModel {
    if (_passwordGeneratorModel == null) {
      _passwordGeneratorModel = Hive.box(HiveKeys.passwordGeneratorBoxName)
          .get(HiveKeys.passwordGeneratorModelKey);
    }
    if (_passwordGeneratorModel == null) {
      _passwordGeneratorModel = PasswordGeneratorModel();
    }
    return PasswordGeneratorModel.fromJson(_passwordGeneratorModel.toJson());
  }

  Future<void> savePasswordGeneratorModel(
      PasswordGeneratorModel newPasswordGeneratorModel) async {
    _passwordGeneratorModel = newPasswordGeneratorModel;
    await Hive.box(HiveKeys.passwordGeneratorBoxName)
        .put(HiveKeys.passwordGeneratorModelKey, newPasswordGeneratorModel);
    notifyListeners();
  }

  Future<void> generatePassword() async {
    String newGeneratedPassword = Utils.generatePassword(
      _passwordGeneratorModel.isWithLowercase,
      _passwordGeneratorModel.isWithUppercase,
      _passwordGeneratorModel.isWithNumbers,
      _passwordGeneratorModel.isWithSymbols,
      _passwordGeneratorModel.length,
    );
    _generatedPassword = newGeneratedPassword;
    await Hive.box(HiveKeys.passwordGeneratorBoxName)
        .put(HiveKeys.generatedPasswordKey, newGeneratedPassword);
    notifyListeners();
  }
}
