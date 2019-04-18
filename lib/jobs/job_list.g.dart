// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$JobList on JobListBase, Store {
  Computed<bool> _$hasSelectionComputed;

  @override
  bool get hasSelection =>
      (_$hasSelectionComputed ??= Computed<bool>(() => super.hasSelection))
          .value;

  final _$jobCategoriesAtom = Atom(name: 'JobListBase.jobCategories');

  @override
  ObservableList<String> get jobCategories {
    _$jobCategoriesAtom.reportObserved();
    return super.jobCategories;
  }

  @override
  set jobCategories(ObservableList<String> value) {
    _$jobCategoriesAtom.context
        .checkIfStateModificationsAreAllowed(_$jobCategoriesAtom);
    super.jobCategories = value;
    _$jobCategoriesAtom.reportChanged();
  }

  final _$jobCategoryAtom = Atom(name: 'JobListBase.jobCategory');

  @override
  String get jobCategory {
    _$jobCategoryAtom.reportObserved();
    return super.jobCategory;
  }

  @override
  set jobCategory(String value) {
    _$jobCategoryAtom.context
        .checkIfStateModificationsAreAllowed(_$jobCategoryAtom);
    super.jobCategory = value;
    _$jobCategoryAtom.reportChanged();
  }

  final _$jobsAtom = Atom(name: 'JobListBase.jobs');

  @override
  ObservableList<Job> get jobs {
    _$jobsAtom.reportObserved();
    return super.jobs;
  }

  @override
  set jobs(ObservableList<Job> value) {
    _$jobsAtom.context.checkIfStateModificationsAreAllowed(_$jobsAtom);
    super.jobs = value;
    _$jobsAtom.reportChanged();
  }

  final _$selectedJobAtom = Atom(name: 'JobListBase.selectedJob');

  @override
  Job get selectedJob {
    _$selectedJobAtom.reportObserved();
    return super.selectedJob;
  }

  @override
  set selectedJob(Job value) {
    _$selectedJobAtom.context
        .checkIfStateModificationsAreAllowed(_$selectedJobAtom);
    super.selectedJob = value;
    _$selectedJobAtom.reportChanged();
  }

  final _$setJobCategoriesAsyncAction = AsyncAction('setJobCategories');

  @override
  Future setJobCategories() {
    return _$setJobCategoriesAsyncAction.run(() => super.setJobCategories());
  }

  final _$selectJobsForCategoryAsyncAction =
      AsyncAction('selectJobsForCategory');

  @override
  Future selectJobsForCategory() {
    return _$selectJobsForCategoryAsyncAction
        .run(() => super.selectJobsForCategory());
  }

  final _$JobListBaseActionController = ActionController(name: 'JobListBase');

  @override
  dynamic setJobCategory(String jobCategory) {
    final _$actionInfo = _$JobListBaseActionController.startAction();
    try {
      return super.setJobCategory(jobCategory);
    } finally {
      _$JobListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectJob(Job job) {
    final _$actionInfo = _$JobListBaseActionController.startAction();
    try {
      return super.selectJob(job);
    } finally {
      _$JobListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectJobWithIndex(int index) {
    final _$actionInfo = _$JobListBaseActionController.startAction();
    try {
      return super.selectJobWithIndex(index);
    } finally {
      _$JobListBaseActionController.endAction(_$actionInfo);
    }
  }
}
