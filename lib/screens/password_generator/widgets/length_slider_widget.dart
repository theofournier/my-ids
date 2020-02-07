import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/animation_controllers/smile_controller.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/models/password_generator_model.dart';
import 'package:my_ids/providers/password_generator_provider.dart';
import 'package:provider/provider.dart';

class LengthSliderWidget extends StatefulWidget {
  @override
  _LengthSliderWidgetState createState() => _LengthSliderWidgetState();
}

class _LengthSliderWidgetState extends State<LengthSliderWidget> {
  SmileController _smileController;

  @override
  void initState() {
    _smileController = SmileController();
    super.initState();
  }

  bool _init = false;
  @override
  void didChangeDependencies() {
    if(!_init){
      _updateSmile(Provider.of<PasswordGeneratorProvider>(context, listen: false).passwordGeneratorModel?.length ?? PasswordGeneratorModel.INIT_LENGTH);
    }
    _init = true;
    super.didChangeDependencies();
  }

  void _updateSmile(int amount) {
    double percentage = amount / PasswordGeneratorModel.MAX_LENGTH;
    _smileController.updateSmilePercent(percentage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 50,
                maxWidth: 50,
              ),
              child: FlareActor(
                "assets/animations/Smile.flr",
                controller: _smileController,
                fit: BoxFit.contain,
                animation: "Smile",
                artboard: "Artboard",
              ),
            ),
          ],
        ),
        Consumer<PasswordGeneratorProvider>(
          builder: (ctx, passwordGeneratorProvider, ch) {
            return
              Slider(
                value: passwordGeneratorProvider.passwordGeneratorModel.length.toDouble(),
                onChanged: (value) async {
                  PasswordGeneratorModel temp = passwordGeneratorProvider.passwordGeneratorModel;
                  temp.length = value.toInt();
                  await passwordGeneratorProvider.savePasswordGeneratorModel(temp);
                  _updateSmile(passwordGeneratorProvider.passwordGeneratorModel.length);
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
