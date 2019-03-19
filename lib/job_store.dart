import 'package:camera/camera.dart';
import 'package:mobx/mobx.dart';

part 'job_store.g.dart';

enum CameraState { initializing, ready, failed }

class JobStore = _JobStore with _$JobStore;

abstract class _JobStore implements Store {
  List<CameraDescription> _cameras = [];

  _JobStore() {
    _prepareCamera();
  }

  @computed
  bool get isCameraReady => _cameraState == CameraState.ready;

  @observable
  CameraState _cameraState = CameraState.initializing;

  @observable
  CameraController _controller;

  @computed
  CameraController get controller => _controller;

  void _prepareCamera() async {
    _cameraState = CameraState.initializing;

    _cameras = await availableCameras();
    _selectCamera(_cameras.first);
  }

  void _selectCamera(CameraDescription camera) async {
    _controller = CameraController(camera, ResolutionPreset.medium);
    await _controller.initialize();

    runInAction(() {
      _cameraState = _controller.value.isInitialized
          ? CameraState.ready
          : CameraState.failed;
    });
  }

  @action
  void flipCamera() {
    _selectCamera(_cameras.last);
  }
}
