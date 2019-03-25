// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$Details on _Details, Store {
  final _$nameAtom = Atom(name: '_Details.name');

  @override
  String get name {
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$nameAtom);
    super.name = value;
    _$nameAtom.reportChanged();
  }

  final _$emailAtom = Atom(name: '_Details.email');

  @override
  String get email {
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$emailAtom);
    super.email = value;
    _$emailAtom.reportChanged();
  }

  final _$phoneAtom = Atom(name: '_Details.phone');

  @override
  String get phone {
    _$phoneAtom.reportObserved();
    return super.phone;
  }

  @override
  set phone(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$phoneAtom);
    super.phone = value;
    _$phoneAtom.reportChanged();
  }

  final _$_DetailsActionController = ActionController(name: '_Details');

  @override
  void setName(String value) {
    final _$actionInfo = _$_DetailsActionController.startAction();
    try {
      return super.setName(value);
    } finally {
      _$_DetailsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_DetailsActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_DetailsActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$_DetailsActionController.startAction();
    try {
      return super.setPhone(value);
    } finally {
      _$_DetailsActionController.endAction(_$actionInfo);
    }
  }
}
