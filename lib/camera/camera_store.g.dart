// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$CameraStore on _CameraStore, Store {
  Computed<bool> _$isCameraReadyComputed;

  @override
  bool get isCameraReady =>
      (_$isCameraReadyComputed ??= Computed<bool>(() => super.isCameraReady))
          .value;

  final _$selectedCameraAtom = Atom(name: '_CameraStore.selectedCamera');

  @override
  CameraDescription get selectedCamera {
    _$selectedCameraAtom.reportObserved();
    return super.selectedCamera;
  }

  @override
  set selectedCamera(CameraDescription value) {
    _$selectedCameraAtom.context
        .checkIfStateModificationsAreAllowed(_$selectedCameraAtom);
    super.selectedCamera = value;
    _$selectedCameraAtom.reportChanged();
  }

  final _$_cameraStateAtom = Atom(name: '_CameraStore._cameraState');

  @override
  CameraState get _cameraState {
    _$_cameraStateAtom.reportObserved();
    return super._cameraState;
  }

  @override
  set _cameraState(CameraState value) {
    _$_cameraStateAtom.context
        .checkIfStateModificationsAreAllowed(_$_cameraStateAtom);
    super._cameraState = value;
    _$_cameraStateAtom.reportChanged();
  }

  final _$capturedPhotoFileAtom = Atom(name: '_CameraStore.capturedPhotoFile');

  @override
  String get capturedPhotoFile {
    _$capturedPhotoFileAtom.reportObserved();
    return super.capturedPhotoFile;
  }

  @override
  set capturedPhotoFile(String value) {
    _$capturedPhotoFileAtom.context
        .checkIfStateModificationsAreAllowed(_$capturedPhotoFileAtom);
    super.capturedPhotoFile = value;
    _$capturedPhotoFileAtom.reportChanged();
  }

  final _$selectCameraAsyncAction = AsyncAction('selectCamera');

  @override
  Future<void> selectCamera(CameraDescription camera) {
    return _$selectCameraAsyncAction.run(() => super.selectCamera(camera));
  }

  final _$takePictureAsyncAction = AsyncAction('takePicture');

  @override
  Future<void> takePicture() {
    return _$takePictureAsyncAction.run(() => super.takePicture());
  }

  final _$_CameraStoreActionController = ActionController(name: '_CameraStore');

  @override
  dynamic clearPhotoPath() {
    final _$actionInfo = _$_CameraStoreActionController.startAction();
    try {
      return super.clearPhotoPath();
    } finally {
      _$_CameraStoreActionController.endAction(_$actionInfo);
    }
  }
}
