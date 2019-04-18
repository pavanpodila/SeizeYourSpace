import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/core/app_page_view.dart';
import 'package:photo_job/core/circle_avatar_photo.dart';
import 'package:photo_job/core/theme.dart';
import 'package:photo_job/home/main_store.dart';
import 'package:provider/provider.dart';

class TakePhotoPage extends StatelessWidget {
  final void Function(BuildContext context) onAccept;

  TakePhotoPage({Key key, @required this.onAccept}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainStore = Provider.of<MainStore>(context);
    final store = mainStore.camera;
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
                        ? PSCircleAvatar(child: CameraPreview(store.controller))
                        : PSCircleAvatar(
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
                            child: PSCircleAvatar(
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
            child: _buildActionButtonBar(context, mainStore),
          ),
        ]),
      ),
    );
  }

  Observer _buildActionButtonBar(BuildContext context, MainStore mainStore) {
    final store = mainStore.camera;

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
                            mainStore.applicant
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
