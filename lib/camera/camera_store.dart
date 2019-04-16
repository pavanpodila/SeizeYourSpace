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

  String _imagesDirectory;
  CameraController controller;

  @observable
  CameraDescription selectedCamera;

  @computed
  bool get isCameraReady => _cameraState == CameraState.ready;

  @observable
  CameraState _cameraState = CameraState.initializing;

  @observable
  String capturedPhotoFile = null;

  void _prepareCamera() async {
    try {
      final cameras = await availableCameras();
      selectCamera(cameras
          .firstWhere((x) => x.lensDirection == CameraLensDirection.front));
    } catch (e) {}
  }

  @action
  Future<void> _clearPastImages() async {
    _imagesDirectory = await _getDirectory();
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

    capturedPhotoFile = filePath;
  }

  static Future<String> _getDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    final testDir = '${dir.path}/profiles/pictures';
    if (!await Directory(testDir).exists()) {
      await Directory(testDir).create(recursive: true);
    }
    return testDir;
  }

  @action
  clearPhotoPath() {
    this.capturedPhotoFile = null;
  }
}
