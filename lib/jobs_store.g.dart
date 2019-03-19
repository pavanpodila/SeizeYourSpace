// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$JobsStore on _JobsStore, Store {
  Computed<bool> _$hasSelectionComputed;

  @override
  bool get hasSelection =>
      (_$hasSelectionComputed ??= Computed<bool>(() => super.hasSelection))
          .value;

  final _$selectedJobAtom = Atom(name: '_JobsStore.selectedJob');

  @override
  Job get selectedJob {
    _$selectedJobAtom.reportObserved();
    return super.selectedJob;
  }

  @override
  set selectedJob(Job value) {
    mainContext.checkIfStateModificationsAreAllowed(_$selectedJobAtom);
    super.selectedJob = value;
    _$selectedJobAtom.reportChanged();
  }

  final _$_JobsStoreActionController = ActionController(name: '_JobsStore');

  @override
  void selectJob(Job job) {
    final _$actionInfo = _$_JobsStoreActionController.startAction();
    try {
      return super.selectJob(job);
    } finally {
      _$_JobsStoreActionController.endAction(_$actionInfo);
    }
  }
}
