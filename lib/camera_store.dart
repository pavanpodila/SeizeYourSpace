import 'dart:io';

import 'package:camera/camera.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'camera_store.g.dart';

enum CameraState { initializing, ready, failed }

class CameraStore = _CameraStore with _$CameraStore;

abstract class _CameraStore implements Store {
  _CameraStore() {
    _prepareCamera();
    _clearPastImages();
  }

  List<CameraDescription> cameras = [];
  String _imagesDirectory;
  CameraController controller;

  @observable
  CameraDescription selectedCamera;

  @computed
  bool get isCameraReady => _cameraState == CameraState.ready;

  @observable
  CameraState _cameraState = CameraState.initializing;

  final ObservableList<String> images = ObservableList();

  void _prepareCamera() async {
    try {
      cameras = await availableCameras();
      selectCamera(cameras
          .firstWhere((x) => x.lensDirection == CameraLensDirection.front));
    } catch (e) {
      cameras = [];
    }
  }

  @action
  Future<void> _clearPastImages() async {
    _imagesDirectory = await _getDirectory();
    Directory(_imagesDirectory).delete();
  }

  @action
  Future<void> selectCamera(CameraDescription camera) async {
    _cameraState = CameraState.initializing;

    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(camera, ResolutionPreset.low);
    await controller.initialize();

    _cameraState =
        controller.value.isInitialized ? CameraState.ready : CameraState.failed;

    selectedCamera = camera;
  }

  @action
  Future<void> takePicture() async {
    if (controller.value.isTakingPicture) {
      return;
    }

    final filePath =
        '$_imagesDirectory/${DateTime.now().millisecondsSinceEpoch}.jpg';

    await controller.takePicture(filePath);

    images.insert(0, filePath);
    print('Picture Taken @ $filePath');
  }

  Future<String> _getDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final testDir = '${dir.path}/Pictures/test';
    await Directory(testDir).create(recursive: true);

    return testDir;
  }
}
