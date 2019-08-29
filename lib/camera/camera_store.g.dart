// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CameraStore on _CameraStore, Store {
  Computed<bool> _$isCameraReadyComputed;

  @override
  bool get isCameraReady =>
      (_$isCameraReadyComputed ??= Computed<bool>(() => super.isCameraReady))
          .value;

  final _$selectedCameraAtom = Atom(name: '_CameraStore.selectedCamera');

  @override
  CameraDescription get selectedCamera {
    _$selectedCameraAtom.context.enforceReadPolicy(_$selectedCameraAtom);
    _$selectedCameraAtom.reportObserved();
    return super.selectedCamera;
  }

  @override
  set selectedCamera(CameraDescription value) {
    _$selectedCameraAtom.context.conditionallyRunInAction(() {
      super.selectedCamera = value;
      _$selectedCameraAtom.reportChanged();
    }, _$selectedCameraAtom, name: '${_$selectedCameraAtom.name}_set');
  }

  final _$_cameraStateAtom = Atom(name: '_CameraStore._cameraState');

  @override
  CameraState get _cameraState {
    _$_cameraStateAtom.context.enforceReadPolicy(_$_cameraStateAtom);
    _$_cameraStateAtom.reportObserved();
    return super._cameraState;
  }

  @override
  set _cameraState(CameraState value) {
    _$_cameraStateAtom.context.conditionallyRunInAction(() {
      super._cameraState = value;
      _$_cameraStateAtom.reportChanged();
    }, _$_cameraStateAtom, name: '${_$_cameraStateAtom.name}_set');
  }

  final _$capturedPhotoFileAtom = Atom(name: '_CameraStore.capturedPhotoFile');

  @override
  String get capturedPhotoFile {
    _$capturedPhotoFileAtom.context.enforceReadPolicy(_$capturedPhotoFileAtom);
    _$capturedPhotoFileAtom.reportObserved();
    return super.capturedPhotoFile;
  }

  @override
  set capturedPhotoFile(String value) {
    _$capturedPhotoFileAtom.context.conditionallyRunInAction(() {
      super.capturedPhotoFile = value;
      _$capturedPhotoFileAtom.reportChanged();
    }, _$capturedPhotoFileAtom, name: '${_$capturedPhotoFileAtom.name}_set');
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
