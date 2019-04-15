import 'package:flutter/cupertino.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:flutter/material.dart';
import 'package:photo_job/core/circular_button.dart';
import 'package:provider/provider.dart';
import 'package:photo_job/jobs/job_list.dart';
import 'package:regexed_validator/regexed_validator.dart';
import 'package:flutter/services.dart';
import 'package:photo_job/applicant_details.dart';

class DetailsPage extends StatefulWidget {

  @override
  _DetailsPageState createState() {
    return _DetailsPageState();
  }
}

class _DetailsPageState extends State<DetailsPage> {

  String _name = '';
  String _phone = '';
  String _email = '';
  final _formKey = GlobalKey<FormState>();
  bool _showDialog = false;
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final jobStore = Provider.of<JobList>(context);
    final applicantDetails = Provider.of<ApplicantDetails>(context);
    return Scaffold(
        body: _showDialog ? CupertinoAlertDialog(
          title: new Text("Success!!"),
          content: new Text("We have received your application. We will get back to you shortly"),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text("Ok"),
              onPressed: () {
                applicantDetails.setNamePhoneAndEmailValue(_name, _email, _phone);
                Navigator.pop(context);
                return Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ) : AppPageView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                child: CircularButton(
                    textContent: '${jobStore.jobCategory}', onSelected: () {}),
                padding: EdgeInsets.only(bottom: 5, top: 10),
              ),
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
                      _addPaddingForField(phoneField(context)),
                      Padding(
                        child: submitButton(context),
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

  _submit(context) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FocusScope.of(context).requestFocus(new FocusNode());
      setState(() {
        _showDialog = true;
      });
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  RaisedButton submitButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _submit(context);
      },
      color: Colors.blueAccent,
      child: Text(
        'Apply',
        style: TextStyle(fontSize: 16.9),
      ),
      textColor: Colors.white70,
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

