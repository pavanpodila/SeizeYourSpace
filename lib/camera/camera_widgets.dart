import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:provider/provider.dart';
import 'package:photo_job/applicant_details.dart';

class TakePhotoPage extends StatelessWidget {
  final CameraStore store;

  final void Function(BuildContext context) onEscape;
  final void Function(BuildContext context) onCancel;
  final void Function(BuildContext context) onAccept;

  TakePhotoPage(
      {Key key,
      @required this.store,
      @required this.onEscape,
      @required this.onAccept,
      @required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final applicantDetails = Provider.of<ApplicantDetails>(context);
    return AppPageView(
      child: Column(children: <Widget>[
        Text(
          'How about a quick selfie?',
          style: TextStyle(fontSize: 25, color: Colors.blueAccent),
        ),
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Observer(
                  builder: (_) => store.isCameraReady
                      ? CircleAvatar(child: CameraPreview(store.controller))
                      : CircleAvatar(
                          color: Colors.grey,
                          child: Text(
                            'No Camera',
                            style: TextStyle(color: Colors.grey),
                          ))),
              Observer(
                  builder: (_) => (store.capturedPhotoFile != null)
                      ? Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: CircleAvatar(
                              borderWidth: 5,
                              color: store.isCameraReady
                                  ? Colors.redAccent
                                  : Colors.grey,
                              child: store.capturedPhotoFile != null
                                  ? Image.file(File(store.capturedPhotoFile),
                                      fit: BoxFit.fitWidth)
                                  : Text('Your Photo'),
                            ),
                          ),
                        )
                      : Container(height: 0, width: 0))
            ],
          ),
        ),
        _buildActionButtonBar(context, applicantDetails),
      ]),
    );
  }

  Observer _buildActionButtonBar(
      BuildContext context, ApplicantDetails applicantDetails) {
    return Observer(
      builder: (_) => store.isCameraReady
          ? Column(
              children: <Widget>[
                CupertinoButton(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: ShapeDecoration(
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: Colors.redAccent, width: 3)),
                            color: Colors.white),
                        child: Icon(
                          CupertinoIcons.photo_camera_solid,
                          size: 40,
                        )),
                    onPressed: store.takePicture),
                (store.capturedPhotoFile != null) ? RaisedButton(
                  onPressed: () {
                    applicantDetails.setImagePath(store.capturedPhotoFile);
                    onAccept(context);
                  },
                  color: Colors.blueAccent,
                  child: Text(
                    'Looks Good',
                    style: TextStyle(fontSize: 16.9),
                  ),
                  textColor: Colors.white70,
                ) : Container(height: 0, width: 0)
              ],
            )
          : Container(),
    );
  }
}

class CircleAvatar extends StatelessWidget {
  CircleAvatar(
      {@required this.child,
      this.color = Colors.redAccent,
      this.backgroundColor = Colors.white,
      this.borderWidth = 10});

  final double borderWidth;

  final Color color;
  final Color backgroundColor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: CircleBorder()),
        child: child,
      ),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(width: borderWidth, color: color),
          shape: BoxShape.circle),
    );
  }
}
