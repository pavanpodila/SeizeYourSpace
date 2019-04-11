// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$Counter on CounterBase, Store {
  Computed<bool> _$hasSelectionComputed;

  @override
  bool get hasSelection =>
      (_$hasSelectionComputed ??= Computed<bool>(() => super.hasSelection))
          .value;

  final _$valueAtom = Atom(name: 'CounterBase.value');

  @override
  int get value {
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    mainContext.checkIfStateModificationsAreAllowed(_$valueAtom);
    super.value = value;
    _$valueAtom.reportChanged();
  }

  final _$jobsAtom = Atom(name: 'CounterBase.jobs');

  @override
  List<Job> get jobs {
    _$jobsAtom.reportObserved();
    return super.jobs;
  }

  @override
  set jobs(List<Job> value) {
    mainContext.checkIfStateModificationsAreAllowed(_$jobsAtom);
    super.jobs = value;
    _$jobsAtom.reportChanged();
  }

  final _$selectedJobAtom = Atom(name: 'CounterBase.selectedJob');

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

  final _$CounterBaseActionController = ActionController(name: 'CounterBase');

  @override
  void increment() {
    final _$actionInfo = _$CounterBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectJob(Job job) {
    final _$actionInfo = _$CounterBaseActionController.startAction();
    try {
      return super.selectJob(job);
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectJobWithIndex(int index) {
    final _$actionInfo = _$CounterBaseActionController.startAction();
    try {
      return super.selectJobWithIndex(index);
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }
}
