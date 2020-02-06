import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/password_generator_model.dart';
import 'package:my_ids/providers/password_generator_provider.dart';
import 'package:my_ids/screens/password_generator/widgets/generated_password_widget.dart';
import 'package:my_ids/screens/password_generator/widgets/length_slider_widget.dart';
import 'package:my_ids/screens/password_generator/widgets/switch_widget.dart';
import 'package:my_ids/widgets/rounded_line.dart';
import 'package:provider/provider.dart';

class PasswordGeneratorScreen extends StatelessWidget {
  static const routeName = "/password-generator";

  bool isValidPasswordGeneratorModel(
      PasswordGeneratorModel newPasswordGeneratorModel) {
    if (!newPasswordGeneratorModel.isWithSymbols &&
        !newPasswordGeneratorModel.isWithNumbers &&
        !newPasswordGeneratorModel.isWithLowercase &&
        !newPasswordGeneratorModel.isWithUppercase) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                S.of(context).passwordGenerator,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              RoundedLine(),
              SizedBox(
                height: 20,
              ),
              Consumer<PasswordGeneratorProvider>(
                builder: (ctx, passwordGeneratorProvider, ch) {
                  return GeneratedPasswordWidget(
                    generatedPassword:
                        passwordGeneratorProvider.generatedPassword,
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              RaisedButton(
                child: Text(
                  S.of(context).generate,
                  style: TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                onPressed: () => Provider.of<PasswordGeneratorProvider>(context,
                        listen: false)
                    .generatePassword(),
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 32.0),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 3,
              ),
              SizedBox(
                height: 30,
              ),
              LengthSliderWidget(),
              SizedBox(
                height: 10,
              ),
              Consumer<PasswordGeneratorProvider>(
                builder: (ctx, passwordGeneratorProvider, ch) {
                  return SwitchWidget(
                    title: S.of(context).symbols,
                    information: "@#=+!£\$%&?[](){}",
                    value: passwordGeneratorProvider
                        .passwordGeneratorModel.isWithSymbols,
                    onChanged: (value) {
                      PasswordGeneratorModel temp =
                          passwordGeneratorProvider.passwordGeneratorModel;
                      temp.isWithSymbols = value;
                      if (isValidPasswordGeneratorModel(temp))
                        passwordGeneratorProvider
                            .savePasswordGeneratorModel(temp);
                    },
                  );
                },
              ),
              Consumer<PasswordGeneratorProvider>(
                builder: (ctx, passwordGeneratorProvider, ch) {
                  return SwitchWidget(
                    title: S.of(context).numbers,
                    value: passwordGeneratorProvider
                        .passwordGeneratorModel.isWithNumbers,
                    onChanged: (value) {
                      PasswordGeneratorModel temp =
                          passwordGeneratorProvider.passwordGeneratorModel;
                      temp.isWithNumbers = value;
                      if (isValidPasswordGeneratorModel(temp))
                        passwordGeneratorProvider
                            .savePasswordGeneratorModel(temp);
                    },
                  );
                },
              ),
              Consumer<PasswordGeneratorProvider>(
                builder: (ctx, passwordGeneratorProvider, ch) {
                  return SwitchWidget(
                    title: S.of(context).lowercase,
                    value: passwordGeneratorProvider
                        .passwordGeneratorModel.isWithLowercase,
                    onChanged: (value) {
                      PasswordGeneratorModel temp =
                          passwordGeneratorProvider.passwordGeneratorModel;
                      temp.isWithLowercase = value;
                      if (isValidPasswordGeneratorModel(temp))
                        passwordGeneratorProvider
                            .savePasswordGeneratorModel(temp);
                    },
                  );
                },
              ),
              Consumer<PasswordGeneratorProvider>(
                builder: (ctx, passwordGeneratorProvider, ch) {
                  return SwitchWidget(
                    title: S.of(context).uppercase,
                    value: passwordGeneratorProvider
                        .passwordGeneratorModel.isWithUppercase,
                    onChanged: (value) {
                      PasswordGeneratorModel temp =
                          passwordGeneratorProvider.passwordGeneratorModel;
                      temp.isWithUppercase = value;
                      if (isValidPasswordGeneratorModel(temp))
                        passwordGeneratorProvider
                            .savePasswordGeneratorModel(temp);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
