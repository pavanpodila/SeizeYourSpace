import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/applicant_details.dart';
import 'package:photo_job/camera/camera_store.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/theme.dart';
import 'package:provider/provider.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          Text(
            'How about a quick selfie?',
            textAlign: TextAlign.center,
            style: theme.headingTextStyle,
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Observer(
                    builder: (_) => store.isCameraReady
                        ? CircleAvatarPhoto(
                            child: CameraPreview(store.controller))
                        : CircleAvatarPhoto(
                            color: theme.lightGray,
                            child: Center(
                                child: Text(
                              'No Camera',
                              style: TextStyle(color: theme.lightGray),
                            )))),
                Observer(
                    builder: (_) => Align(
                          alignment: Alignment.bottomLeft,
                          child: SizedBox(
                            width: 150,
                            height: 150,
                            child: CircleAvatarPhoto(
                                borderWidth: 5,
                                color: store.isCameraReady
                                    ? theme.radiantRed
                                    : theme.lightGray,
                                child: store.capturedPhotoFile != null
                                    ? Image.file(File(store.capturedPhotoFile),
                                        fit: BoxFit.fitWidth)
                                    : Center(
                                        child: Text(
                                          'Your Photo',
                                          style: theme.actionTextStyle
                                              .apply(color: theme.lightGray),
                                        ),
                                      )),
                          ),
                        ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: _buildActionButtonBar(context, applicantDetails),
          ),
        ]),
      ),
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
                        padding: EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                            shape: CircleBorder(), color: theme.radiantRed),
                        child: Icon(
                          CupertinoIcons.photo_camera_solid,
                          size: 40,
                          color: Colors.white,
                        )),
                    onPressed: store.takePicture),
                CupertinoButton(
                    onPressed: (store.capturedPhotoFile != null)
                        ? () {
                            applicantDetails
                                .setImagePath(store.capturedPhotoFile);
                            onAccept(context);
                          }
                        : null,
                    color: theme.blue,
                    child: Text(
                      'Looks Good',
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            )
          : CupertinoButton(
              child: Text('Proceed without Photo'),
              onPressed: () {
                onAccept(context);
              },
            ),
    );
  }
}

class CircleAvatarPhoto extends StatelessWidget {
  CircleAvatarPhoto(
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
