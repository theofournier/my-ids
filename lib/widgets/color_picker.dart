import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';

class ColorPicker extends StatefulWidget {
  final List<Color> colors;
  final Color initColor;

  ColorPicker({@required this.colors, this.initColor});

  @override
  _ColorPickerState createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  int _indexPickedColor;

  @override
  void initState() {
    super.initState();
    if (widget.initColor != null) {
      _indexPickedColor = widget.colors
          .indexWhere((color) => color.value == widget.initColor.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(S.of(context).color),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          textColor: Theme.of(context).errorColor,
          child: Text(S.of(context).cancel),
        ),
        FlatButton(
          onPressed: () {
            if (_indexPickedColor != null) {
              Navigator.of(context).pop(widget.colors[_indexPickedColor]);
            }
          },
          textColor: Theme.of(context).primaryColor,
          child: Text(S.of(context).ok),
        ),
      ],
      content: Container(
        width: 100,
        height: 300.0,
        child: Scrollbar(
          child: ListView.separated(
            padding: EdgeInsets.all(8.0),
            separatorBuilder: (ctx, index) => SizedBox(
              height: 5,
            ),
            itemCount: widget.colors.length,
            itemBuilder: (ctx, index) {
              return _buildColorItem(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildColorItem(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _indexPickedColor = index;
        });
      },
      onDoubleTap: () {
        Navigator.of(context).pop(widget.colors[index]);
      },
      child: Container(
        height: 50,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: _indexPickedColor != index
              ? widget.colors[index]
              : widget.colors[index].withOpacity(0.7),
          child: _indexPickedColor != index
              ? null
              : Icon(
                  Icons.done_outline,
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
