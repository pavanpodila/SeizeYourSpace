// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$MainStore on _MainStore, Store {
  final _$applicantAtom = Atom(name: '_MainStore.applicant');

  @override
  Applicant get applicant {
    _$applicantAtom.reportObserved();
    return super.applicant;
  }

  @override
  set applicant(Applicant value) {
    _$applicantAtom.context
        .checkIfStateModificationsAreAllowed(_$applicantAtom);
    super.applicant = value;
    _$applicantAtom.reportChanged();
  }

  final _$applicantsAtom = Atom(name: '_MainStore.applicants');

  @override
  ObservableFuture<List<Applicant>> get applicants {
    _$applicantsAtom.reportObserved();
    return super.applicants;
  }

  @override
  set applicants(ObservableFuture<List<Applicant>> value) {
    _$applicantsAtom.context
        .checkIfStateModificationsAreAllowed(_$applicantsAtom);
    super.applicants = value;
    _$applicantsAtom.reportChanged();
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
