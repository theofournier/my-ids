import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/password_generator_model.dart';
import 'package:my_ids/providers/password_generator_provider.dart';
import 'package:provider/provider.dart';

class LengthSliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              S.of(context).length,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SizedBox(width: 24,),
            Consumer<PasswordGeneratorProvider>(
              builder: (ctx, passwordGeneratorProvider, ch) {
                return Text(
                  passwordGeneratorProvider.passwordGeneratorModel.length.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).accentColor,
                  ),
                );
              },
            ),
          ],
        ),
        Consumer<PasswordGeneratorProvider>(
          builder: (ctx, passwordGeneratorProvider, ch) {
            return
              Slider(
                value: passwordGeneratorProvider.passwordGeneratorModel.length.toDouble(),
                onChanged: (value) {
                  PasswordGeneratorModel temp = passwordGeneratorProvider.passwordGeneratorModel;
                  temp.length = value.toInt();
                  passwordGeneratorProvider.savePasswordGeneratorModel(temp);
                },
                min: 0,
                max: PasswordGeneratorModel.MAX_LENGTH.toDouble(),
                activeColor: Theme.of(context).accentColor,
              );
          },
        ),
      ],
    );
  }
}
