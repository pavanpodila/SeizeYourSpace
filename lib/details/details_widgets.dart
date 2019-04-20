import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circle_avatar_photo.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:photo_job/core/domain/applicant.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:provider/provider.dart';
import 'package:regexed_validator/regexed_validator.dart';

class DetailsPage extends StatefulWidget {
  @override
  DetailsPageState createState() {
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  String _name = '';
  String _phone = '';
  String _email = '';
  final _formKey = GlobalKey<FormState>();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);
    final jobStore = mainStore.jobStore;
    final applicant = mainStore.applicant;

    return Scaffold(
        body: AppPageView(
      child: GestureDetector(
        onTap: _dismissKeyboard,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: PSCircleAvatar(
                        borderWidth: 5,
                        child: applicant.picPath != null
                            ? Image.file(File(applicant.picPath),
                                fit: BoxFit.fitWidth)
                            : Container(
                                decoration:
                                    BoxDecoration(color: theme.lightGray),
                              ),
                      ),
                    ),
                    CircularButton(
                        text: jobStore.selectedCategory, onPressed: () {})
                  ]),
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: nameField(context, applicant),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: emailFormField(context, applicant),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: phoneField(context, applicant),
                    ),
                    submitButton(context, applicant),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  @override
  void dispose() {
    _dismissKeyboard();
    super.dispose();
  }

  TextFormField phoneField(BuildContext context, Applicant applicant) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      focusNode: _phoneFocus,
      onFieldSubmitted: (term) {
        _phoneFocus.unfocus();
        _submit(context, applicant);
      },
      validator: (value) {
        if (validator.phone(value) != true || value.length < 10) {
          return ('Invalid Phone Number');
        }
      },
      onSaved: (value) {
        _phone = value;
      },
      decoration: new InputDecoration(
        alignLabelWithHint: true,
        labelText: "Phone",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5),
          borderSide: new BorderSide(),
        ),
      ),
    );
  }

  TextFormField emailFormField(BuildContext context, Applicant applicant) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      focusNode: _emailFocus,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) {
        _fieldFocusChange(context, _emailFocus, _phoneFocus);
      },
      validator: (value) {
        if (validator.email(value) != true) {
          return ('Invalid email');
        }
      },
      onSaved: (value) {
        _email = value;
      },
      decoration: new InputDecoration(
        labelText: "Email",
        fillColor: Colors.white,
        border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5),
          borderSide: new BorderSide(),
        ),
      ),
    );
  }

  TextFormField nameField(BuildContext context, Applicant applicant) {
    return TextFormField(
        decoration: new InputDecoration(
          labelText: "Name",
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5),
            borderSide: new BorderSide(),
          ),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        focusNode: _nameFocus,
        onFieldSubmitted: (term) {
          _fieldFocusChange(context, _nameFocus, _emailFocus);
        },
        validator: (value) {
          if ((isNumeric(value) == true) || (value.length <= 1)) {
            return ('Name cannot be empty');
          }
        },
        onSaved: (value) {
          _name = value;
        });
  }

  _submit(context, applicantDetails) {
    if (_formKey.currentState.validate()) {
      final mainStore = Provider.of<MainStore>(context);
      _formKey.currentState.save();
      _dismissKeyboard();

      mainStore.submitApplication(context,
          name: _name, email: _email, phone: _phone);
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }

    try {
      return double.parse(s) != null;
    } catch (e) {
      return false;
    }
  }

  Widget submitButton(BuildContext context, Applicant applicant) {
    return CupertinoButton(
        onPressed: () {
          _submit(context, applicant);
        },
        color: theme.blue,
        child: Text(
          'Apply',
          style: theme.bodyTextStyle,
        ));
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _dismissKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }
}
