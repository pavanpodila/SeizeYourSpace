// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$JobStore on _JobStore, Store {
  Computed<List<String>> _$jobCategoriesComputed;

  @override
  List<String> get jobCategories => (_$jobCategoriesComputed ??=
          Computed<List<String>>(() => super.jobCategories))
      .value;
  Computed<List<Job>> _$jobsComputed;

  @override
  List<Job> get jobs =>
      (_$jobsComputed ??= Computed<List<Job>>(() => super.jobs)).value;
  Computed<bool> _$hasSelectionComputed;

  @override
  bool get hasSelection =>
      (_$hasSelectionComputed ??= Computed<bool>(() => super.hasSelection))
          .value;

  final _$_jobsMapAtom = Atom(name: '_JobStore._jobsMap');

  @override
  Map<String, List<Job>> get _jobsMap {
    _$_jobsMapAtom.context.enforceReadPolicy(_$_jobsMapAtom);
    _$_jobsMapAtom.reportObserved();
    return super._jobsMap;
  }

  @override
  set _jobsMap(Map<String, List<Job>> value) {
    _$_jobsMapAtom.context.conditionallyRunInAction(() {
      super._jobsMap = value;
      _$_jobsMapAtom.reportChanged();
    }, _$_jobsMapAtom, name: '${_$_jobsMapAtom.name}_set');
  }

  final _$selectedCategoryAtom = Atom(name: '_JobStore.selectedCategory');

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.context.enforceReadPolicy(_$selectedCategoryAtom);
    _$selectedCategoryAtom.reportObserved();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.context.conditionallyRunInAction(() {
      super.selectedCategory = value;
      _$selectedCategoryAtom.reportChanged();
    }, _$selectedCategoryAtom, name: '${_$selectedCategoryAtom.name}_set');
  }

  final _$selectedJobAtom = Atom(name: '_JobStore.selectedJob');

  @override
  Job get selectedJob {
    _$selectedJobAtom.context.enforceReadPolicy(_$selectedJobAtom);
    _$selectedJobAtom.reportObserved();
    return super.selectedJob;
  }

  @override
  set selectedJob(Job value) {
    _$selectedJobAtom.context.conditionallyRunInAction(() {
      super.selectedJob = value;
      _$selectedJobAtom.reportChanged();
    }, _$selectedJobAtom, name: '${_$selectedJobAtom.name}_set');
  }

  final _$loadJobsAsyncAction = AsyncAction('loadJobs');

  @override
  Future<void> loadJobs() {
    return _$loadJobsAsyncAction.run(() => super.loadJobs());
  }

  final _$_JobStoreActionController = ActionController(name: '_JobStore');

  @override
  dynamic setJobCategory(String jobCategory) {
    final _$actionInfo = _$_JobStoreActionController.startAction();
    try {
      return super.setJobCategory(jobCategory);
    } finally {
      _$_JobStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectJob(Job job) {
    final _$actionInfo = _$_JobStoreActionController.startAction();
    try {
      return super.selectJob(job);
    } finally {
      _$_JobStoreActionController.endAction(_$actionInfo);
    }
  }
}
