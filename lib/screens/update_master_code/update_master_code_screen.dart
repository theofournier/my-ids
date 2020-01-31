import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:my_ids/generated/l10n.dart';
import 'package:my_ids/providers/auth_provider.dart';
import 'package:my_ids/utils/utils.dart';
import 'package:my_ids/widgets/default_textformfield.dart';
import 'package:my_ids/widgets/rounded_line.dart';
import 'package:provider/provider.dart';

class UpdateMasterCodeScreen extends StatefulWidget {
  static const routeName = "/update-master-code";

  @override
  _UpdateMasterCodeScreenState createState() => _UpdateMasterCodeScreenState();
}

class _UpdateMasterCodeScreenState extends State<UpdateMasterCodeScreen> {
  final data = {
    "currentMasterCode": "",
    "newMasterCode": "",
  };

  final _formKey = GlobalKey<FormState>();
  final _newMasterCodeFocusNode = FocusNode();

  bool _currentMasterCodeIsVisible = false;
  bool _newMasterCodeIsVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _newMasterCodeFocusNode.dispose();
    super.dispose();
  }

  void _toggleCurrentMasterCodeVisibility() {
    setState(() {
      _currentMasterCodeIsVisible = !_currentMasterCodeIsVisible;
    });
  }

  void _toggleNewMasterCodeVisibility() {
    setState(() {
      _newMasterCodeIsVisible = !_newMasterCodeIsVisible;
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (Provider.of<AuthProvider>(context, listen: false)
        .checkPassword(data["currentMasterCode"])) {
      Provider.of<AuthProvider>(context, listen: false).savePassword(data["newMasterCode"]);
      setState(() {
        data["currentMasterCode"] = "";
        data["newMasterCode"] = "";
      });
      _formKey.currentState.reset();
      Flushbar(
        title: S.of(context).updateMasterCodeSuccessTitle,
        message: S.of(context).updateMasterCodeSuccessMessage,
        duration: Duration(seconds: 7),
        margin: const EdgeInsets.all(8),
        borderRadius: 8,
        icon: Icon(
          Icons.done,
          size: 28.0,
          color: Theme.of(context).accentColor,
        ),
      )..show(context);
    } else {
      Flushbar(
        title: S.of(context).updateMasterCodeErrorTitle,
        message: S.of(context).updateMasterCodeErrorTitle,
        duration: Duration(seconds: 7),
        margin: const EdgeInsets.all(8),
        borderRadius: 8,
        icon: Icon(
          Icons.error_outline,
          size: 28.0,
          color: Theme.of(context).errorColor,
        ),
      )..show(context);
    }
    setState(() {
      _isLoading = false;
    });
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
                S.of(context).updateMasterCode,
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
                height: 40,
              ),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    if (_isLoading)
      return Center(
        child: const CircularProgressIndicator(),
      );
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          DefaultTextFormField(
            labelText: S.of(context).currentMasterCode,
            prefixIcon: Icons.lock_outline,
            passwordIsVisible: _currentMasterCodeIsVisible,
            togglePasswordVisibility: _toggleCurrentMasterCodeVisibility,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value.isEmpty)
                return "${S.of(context).currentMasterCode} ${S.of(context).isRequired}";
              if (!Utils.isMasterCodeValid(value))
                return S.of(context).errorMasterCodeInvalid;
              return null;
            },
            onSaved: (value) {
              data["currentMasterCode"] = value;
            },
            onFieldSubmitted: (_) =>
                FocusScope.of(context).requestFocus(_newMasterCodeFocusNode),
          ),
          DefaultTextFormField(
            focusNode: _newMasterCodeFocusNode,
            labelText: S.of(context).newMasterCode,
            prefixIcon: Icons.lock_outline,
            passwordIsVisible: _newMasterCodeIsVisible,
            togglePasswordVisibility: _toggleNewMasterCodeVisibility,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            validator: (value) {
              if (value.isEmpty)
                return "${S.of(context).newMasterCode} ${S.of(context).isRequired}";
              if (!Utils.isMasterCodeValid(value))
                return S.of(context).errorMasterCodeInvalid;
              return null;
            },
            onSaved: (value) {
              data["newMasterCode"] = value;
            },
            onFieldSubmitted: (_) => _submit(),
          ),
          SizedBox(
            height: 60,
          ),
          RaisedButton(
            child: Text(
              S.of(context).save,
              style: TextStyle(
                fontFamily: "OpenSans",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            onPressed: _submit,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
            color: Theme.of(context).accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 3,
          ),
        ],
      ),
    );
  }
}
