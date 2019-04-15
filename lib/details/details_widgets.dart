import 'package:flutter/cupertino.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:regexed_validator/regexed_validator.dart';

var formKey = GlobalKey<FormState>();

class DetailsPage extends StatelessWidget {

  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  nameField(context),
                  emailFormField(context),
                  phoneField(context),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: submitButton(context)
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField phoneField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      focusNode: _phoneFocus,
      onFieldSubmitted: (term) {
        _phoneFocus.unfocus();
        _submit(context);
      },
      validator: (value) {
        if (validator.phone(value) != true || value.length < 10) {
          return ('Invalid Phone Number');
        }
      },
      onSaved: (value) {
        print(value);
      },
      decoration: InputDecoration(
          hintText: 'Enter Your Phone Number',
          labelText: 'Phone',
          fillColor: Colors.white
      ),
    );
  }

  TextFormField emailFormField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocus,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value){
        _fieldFocusChange(context, _emailFocus, _phoneFocus);
      },
      validator: (value) {
        if (validator.email(value) != true) {
          return ('Invalid email');
        }
      },
      onSaved: (value) {
        print(value);
      },
      decoration: InputDecoration(
          hintText: 'Enter Your Email',
          labelText: 'Email',
          fillColor: Colors.white
      ),
    );
  }

  TextFormField nameField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: _nameFocus,
      onFieldSubmitted: (term){
        _fieldFocusChange(context, _nameFocus, _emailFocus);
      },
      validator: (value) {
        if ((isNumeric(value) == true) || (value.length <= 1)) {
          return ('Enter Name');
        }
      },
      onSaved: (value) {
        print(value);
      },
      decoration: InputDecoration(
          hintText: 'Enter Your Name',
          labelText: 'Name',
          fillColor: Colors.white
      ),
    );
  }

  _submit(context) {
    if (formKey.currentState.validate()) {
      print('formData');
      print(formKey.currentState);
      formKey.currentState.save();
      Navigator.pop(context);
      return Navigator.pushNamed(context, '/');
    }
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  RaisedButton submitButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
       _submit(context);
      },
      color: Colors.pinkAccent,
      child: Text(
        'Submit',
        style: TextStyle(fontSize: 16.9),
      ),
      textColor: Colors.white70,
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}