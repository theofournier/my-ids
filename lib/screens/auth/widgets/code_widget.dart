import 'package:flutter/material.dart';
import 'package:my_ids/widgets/rounded_line.dart';

class CodeWidget extends StatefulWidget {
  final String title;
  final Function(String password) onDone;
  final String Function(String value) validator;

  CodeWidget({
    Key key,
    this.title,
    this.onDone,
    this.validator,
  }) : super(key: key);

  @override
  _CodeWidgetState createState() => _CodeWidgetState();
}

class _CodeWidgetState extends State<CodeWidget> {
  String _password = "";
  String _errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        if (widget.title != null)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        _buildCodeIcons(),
        SizedBox(
          height: 20,
        ),
        if (_errorMessage != null)
          Text(
            _errorMessage,
            style: TextStyle(
              color: Theme.of(context).errorColor,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _buildCodeButtons(),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  Widget _buildCodeIcons() {
    if (_password == null || _password.isEmpty)
      return SizedBox(
        height: 20,
      );
    List<Widget> widgets = [];
    for (int i = 0; i < _password.length; i++) {
      widgets.add(_CodeIcon());
      if (i < _password.length - 1) {
        widgets.add(SizedBox(
          width: 20,
        ));
      }
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widgets,
    );
  }

  void _onPressedDigit(String value) {
    if (_password.length < 8) {
      setState(() {
        _errorMessage = "";
        _password += value;
      });
    }
  }

  void _onPressedDelete() {
    if (_password.length > 0) {
      setState(() {
        _password = _password.substring(0, _password.length - 1);
      });
    }
  }

  void _onPressedDone() {
    if (widget.validator != null) {
      String temp = widget.validator(_password);
      if (temp != null) {
        setState(() {
          _errorMessage = temp;
        });
        return;
      }
    }
    widget.onDone(_password);
    setState(() {
      _errorMessage = "";
      _password = "";
    });
  }

  Widget _buildCodeButtons() {
    List<List<String>> digits = [
      ["1", "2", "3"],
      ["4", "5", "6"],
      ["7", "8", "9"],
      ["DELETE", "0", "DONE"]
    ];

    return Column(
      children: digits
          .map(
            (row) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: row.map(
                (item) {
                  IconData icon;
                  Function onPressed = () => this._onPressedDigit(item);
                  if (item == "DELETE") {
                    icon = Icons.backspace;
                    onPressed = this._onPressedDelete;
                  }
                  if (item == "DONE") {
                    icon = Icons.done;
                    onPressed = this._onPressedDone;
                  }
                  return Expanded(
                    child: _CodeButton(
                      icon: icon,
                      title: item,
                      onPressed: onPressed,
                    ),
                  );
                },
              ).toList(),
            ),
          )
          .toList(),
    );
  }
}

class _CodeIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _CodeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPressed;

  _CodeButton({
    this.title,
    this.icon,
    this.onPressed,
  });

  Widget _buildChild() {
    if (icon != null) {
      return Icon(icon);
    }
    return Text(
      title,
      style: TextStyle(
        fontSize: 25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      radius: 50,
      onTap: onPressed,
      child: Container(
        height: 70,
        width: 70,
        child: Center(
          child: _buildChild(),
        ),
      ),
    );
  }
}
