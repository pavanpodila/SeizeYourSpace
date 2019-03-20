import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:photo_job/camera/camera_store.dart';

class TakePhotoPage extends StatelessWidget {
  final CameraStore store;

  final void Function(BuildContext context) onEscape;

  TakePhotoPage({Key key, @required this.store, @required this.onEscape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: SafeArea(
            child: Align(
      alignment: Alignment.center,
      child: Column(children: <Widget>[
        CupertinoButton(
          onPressed: () => onEscape(context),
          child: Text('Escape'),
        ),
        Observer(
            builder: (_) => store.isCameraReady
                ? Expanded(
                    child: CircleAvatar(
                        child: AspectRatio(
                            aspectRatio: store.controller.value.aspectRatio,
                            child: CameraPreview(store.controller))))
                : Expanded(
                    child: CircleAvatar(
                        color: Colors.grey,
                        child: Text(
                          'No Camera',
                          style: TextStyle(color: Colors.grey),
                        )))),
        Observer(
          builder: (_) => store.isCameraReady
              ? CupertinoButton(
                  onPressed: store.takePicture,
                  child: Text('Take Picture'),
                )
              : Container(),
        ),
        Observer(
          builder: (_) => SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: store.images.length,
                  itemBuilder: (_, index) => Image.file(
                        File(store.images[index]),
                        key: Key(store.images[index]),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ))),
        ),
      ]),
    )));
  }

  Widget getIcon(CameraLensDirection direction) {
    switch (direction) {
      case CameraLensDirection.front:
        return Text('Front');
      case CameraLensDirection.back:
        return Text('Back');
      default:
        return Text('External');
    }
  }
}

class CircleAvatar extends StatelessWidget {
  CircleAvatar(
      {@required this.child, this.color = Colors.redAccent, this.width = 10});

  final double width;

  final Color color;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: CircleBorder()),
        child: Align(
          child: child,
          alignment: Alignment.center,
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(width: width, color: color),
          shape: BoxShape.circle),
    );
  }
}
