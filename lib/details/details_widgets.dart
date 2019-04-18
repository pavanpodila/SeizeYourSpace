import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:photo_job/applicant_details.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/camera/camera_widgets.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:photo_job/jobs/job_list.dart';
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
    final jobStore = Provider.of<JobList>(context);
    final applicantDetails = Provider.of<ApplicantDetails>(context);
    return Scaffold(
        body: AppPageView(
      child: ListView(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SizedBox(
              width: 125,
              height: 125,
              child: CircleAvatarPhoto(
                borderWidth: 5,
                color: Colors.blueAccent,
                child: applicantDetails.picPath != null
                    ? Image.file(File(applicantDetails.picPath),
                        fit: BoxFit.fitWidth)
                    : Container(
                        decoration: BoxDecoration(color: Colors.black12),
                      ),
              ),
            ),
            Padding(
              child: CircularButton(
                  text: '${jobStore.jobCategory}', onPressed: () {}),
              padding: EdgeInsets.only(bottom: 5, top: 10),
            )
          ]),
          Padding(
            child: Divider(
              color: Colors.black26,
            ),
            padding: EdgeInsets.only(bottom: 5),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidate: true,
              child: Column(
                children: <Widget>[
                  _addPaddingForField(nameField(context)),
                  _addPaddingForField(emailFormField(context)),
                  _addPaddingForField(phoneField(context, applicantDetails)),
                  Padding(
                    child: submitButton(context, applicantDetails),
                    padding: EdgeInsets.only(top: 5),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  _addPaddingForField(Widget widget) {
    return Padding(
      child: widget,
      padding: EdgeInsets.all(8),
    );
  }

  TextFormField phoneField(
      BuildContext context, ApplicantDetails applicantDetails) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      focusNode: _phoneFocus,
      onFieldSubmitted: (term) {
        _phoneFocus.unfocus();
        _submit(context, applicantDetails);
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

  TextFormField emailFormField(BuildContext context) {
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

  TextFormField nameField(BuildContext context) {
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
      final cameraStore = Provider.of<CameraStore>(context);
      _formKey.currentState.save();
      FocusScope.of(context).requestFocus(new FocusNode());
      cameraStore.clearPhotoPath();
      applicantDetails.setNamePhoneAndEmailValue(_name, _email, _phone);

      Navigator.pushNamed(context, '/complete');
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  Widget submitButton(BuildContext context, ApplicantDetails applicantDetails) {
    return CupertinoButton(
        onPressed: () {
          _submit(context, applicantDetails);
        },
        color: Colors.blueAccent,
        child: Text(
          'Apply',
          style: TextStyle(fontSize: 16),
        ));
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
