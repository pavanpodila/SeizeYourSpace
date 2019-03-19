import 'package:camera/camera.dart';
import 'package:mobx/mobx.dart';

part 'job_store.g.dart';

enum CameraState { initializing, ready, failed }

class JobStore = _JobStore with _$JobStore;

abstract class _JobStore implements Store {
  _JobStore() {
    _prepareCamera();
  }

  List<CameraDescription> _cameras = [];

  CameraDescription _selectedCamera;

  @computed
  bool get isCameraReady => _cameraState == CameraState.ready;

  @observable
  CameraState _cameraState = CameraState.initializing;

  @observable
  CameraController _controller;

  @computed
  CameraController get controller => _controller;

  void _prepareCamera() async {
    _cameras = await availableCameras();
    _selectCamera(_cameras.first);
  }

  @action
  Future<void> _selectCamera(CameraDescription camera) async {
    _cameraState = CameraState.initializing;

    if (_controller != null) {
      await _controller.dispose();
    }

    _controller = CameraController(camera, ResolutionPreset.medium);
    await _controller.initialize();

    _cameraState = _controller.value.isInitialized
        ? CameraState.ready
        : CameraState.failed;

    _selectedCamera = camera;
  }

  @action
  void flipCamera() {
    final index = _cameras.indexOf(_selectedCamera);
    if (index >= 0) {
      final nextIndex = (index + 1) % _cameras.length;
      _selectCamera(_cameras[nextIndex]);
    }
  }
}
