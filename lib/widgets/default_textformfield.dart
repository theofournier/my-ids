import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final IconData prefixIcon;
  final IconData suffixIcon;
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function(String value) validator;
  final Function(String value) onFieldSubmitted;
  final Function(String value) onSaved;
  final String initialValue;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool autoFocus;
  final bool passwordIsVisible;
  final VoidCallback togglePasswordVisibility;
  final TextCapitalization textCapitalization;
  final int minLines;
  final int maxLines;
  final double textSize;

  DefaultTextFormField({
    Key key,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.keyboardType,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.initialValue,
    this.focusNode,
    this.controller,
    this.autoFocus = false,
    this.passwordIsVisible,
    this.togglePasswordVisibility,
    this.textCapitalization = TextCapitalization.none,
    this.minLines = 1,
    this.maxLines = 1,
    this.textSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      autofocus: autoFocus,
      obscureText: passwordIsVisible != null ? !passwordIsVisible : false,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      initialValue: initialValue,
      minLines: minLines,
      maxLines: maxLines,

      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(fontSize: textSize),
        alignLabelWithHint: true,
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
              )
            : null,
        suffixIcon: _buildSuffixIcon(context),
      ),
      style: TextStyle(
        color: Colors.black,
        fontSize: textSize,
      ),
      textCapitalization: textCapitalization,
    );
  }

  Widget _buildSuffixIcon(BuildContext context) {
    if (passwordIsVisible != null)
      return IconButton(
        icon: Icon(passwordIsVisible ? Icons.visibility_off : Icons.visibility),
        onPressed: togglePasswordVisibility,
        color: Theme.of(context).accentColor.withOpacity(0.8),
      );
    if (suffixIcon != null)
      Icon(
        suffixIcon,
      );
    return null;
  }
}
