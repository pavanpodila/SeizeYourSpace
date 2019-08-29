// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$applicantAtom = Atom(name: '_MainStore.applicant');

  @override
  Applicant get applicant {
    _$applicantAtom.context.enforceReadPolicy(_$applicantAtom);
    _$applicantAtom.reportObserved();
    return super.applicant;
  }

  @override
  set applicant(Applicant value) {
    _$applicantAtom.context.conditionallyRunInAction(() {
      super.applicant = value;
      _$applicantAtom.reportChanged();
    }, _$applicantAtom, name: '${_$applicantAtom.name}_set');
  }

  final _$applicantsAtom = Atom(name: '_MainStore.applicants');

  @override
  ObservableFuture<List<Applicant>> get applicants {
    _$applicantsAtom.context.enforceReadPolicy(_$applicantsAtom);
    _$applicantsAtom.reportObserved();
    return super.applicants;
  }

  @override
  set applicants(ObservableFuture<List<Applicant>> value) {
    _$applicantsAtom.context.conditionallyRunInAction(() {
      super.applicants = value;
      _$applicantsAtom.reportChanged();
    }, _$applicantsAtom, name: '${_$applicantsAtom.name}_set');
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  dynamic beginApplication(BuildContext context) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.beginApplication(context);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic endApplication(BuildContext context) {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.endApplication(context);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic loadApplicants() {
    final _$actionInfo = _$_MainStoreActionController.startAction();
    try {
      return super.loadApplicants();
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }
}
