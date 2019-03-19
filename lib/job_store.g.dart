// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$JobStore on _JobStore, Store {
  Computed<bool> _$isCameraReadyComputed;

  @override
  bool get isCameraReady =>
      (_$isCameraReadyComputed ??= Computed<bool>(() => super.isCameraReady))
          .value;

  final _$selectedCameraAtom = Atom(name: '_JobStore.selectedCamera');

  @override
  CameraDescription get selectedCamera {
    _$selectedCameraAtom.reportObserved();
    return super.selectedCamera;
  }

  @override
  set selectedCamera(CameraDescription value) {
    mainContext.checkIfStateModificationsAreAllowed(_$selectedCameraAtom);
    super.selectedCamera = value;
    _$selectedCameraAtom.reportChanged();
  }

  final _$_cameraStateAtom = Atom(name: '_JobStore._cameraState');

  @override
  CameraState get _cameraState {
    _$_cameraStateAtom.reportObserved();
    return super._cameraState;
  }

  @override
  set _cameraState(CameraState value) {
    mainContext.checkIfStateModificationsAreAllowed(_$_cameraStateAtom);
    super._cameraState = value;
    _$_cameraStateAtom.reportChanged();
  }

  final _$_loadImagesAsyncAction = AsyncAction('_loadImages');

  @override
  Future<void> _loadImages() {
    return _$_loadImagesAsyncAction.run(() => super._loadImages());
  }

  final _$selectCameraAsyncAction = AsyncAction('selectCamera');

  @override
  Future<void> selectCamera(CameraDescription camera) {
    return _$selectCameraAsyncAction.run(() => super.selectCamera(camera));
  }
}
