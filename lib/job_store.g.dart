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
  Computed<CameraController> _$controllerComputed;

  @override
  CameraController get controller => (_$controllerComputed ??=
          Computed<CameraController>(() => super.controller))
      .value;

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

  final _$_controllerAtom = Atom(name: '_JobStore._controller');

  @override
  CameraController get _controller {
    _$_controllerAtom.reportObserved();
    return super._controller;
  }

  @override
  set _controller(CameraController value) {
    mainContext.checkIfStateModificationsAreAllowed(_$_controllerAtom);
    super._controller = value;
    _$_controllerAtom.reportChanged();
  }

  final _$_selectCameraAsyncAction = AsyncAction('_selectCamera');

  @override
  Future<void> _selectCamera(CameraDescription camera) {
    return _$_selectCameraAsyncAction.run(() => super._selectCamera(camera));
  }

  final _$_JobStoreActionController = ActionController(name: '_JobStore');

  @override
  void flipCamera() {
    final _$actionInfo = _$_JobStoreActionController.startAction();
    try {
      return super.flipCamera();
    } finally {
      _$_JobStoreActionController.endAction(_$actionInfo);
    }
  }
}
