import 'dart:io';

import 'package:camera/camera.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';

part 'job_store.g.dart';

enum CameraState { initializing, ready, failed }

class JobStore = _JobStore with _$JobStore;

abstract class _JobStore implements Store {
  _JobStore() {
    _prepareCamera();
  }

  List<CameraDescription> cameras = [];

  @observable
  CameraDescription selectedCamera;

  @computed
  bool get isCameraReady => _cameraState == CameraState.ready;

  @observable
  CameraState _cameraState = CameraState.initializing;

  CameraController controller;

  void _prepareCamera() async {
    cameras = await availableCameras();
    selectCamera(cameras
        .firstWhere((x) => x.lensDirection == CameraLensDirection.front));
  }

  @action
  Future<void> selectCamera(CameraDescription camera) async {
    _cameraState = CameraState.initializing;

    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(camera, ResolutionPreset.medium);
    await controller.initialize();

    _cameraState =
        controller.value.isInitialized ? CameraState.ready : CameraState.failed;

    selectedCamera = camera;
  }

  void takePicture() async {
    if (controller.value.isTakingPicture) {
      return;
    }

    final dir = await getApplicationDocumentsDirectory();
    final testDir = '${dir.path}/Pictures/test';
    await Directory(testDir).create(recursive: true);

    final filePath = '$testDir/${DateTime.now().millisecondsSinceEpoch}.jpg';

    await controller.takePicture(filePath);

    print('Picture Taken @ $filePath');
  }
}
