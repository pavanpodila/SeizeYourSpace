// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies

mixin _$Job on JobBase, Store {
  final _$idAtom = Atom(name: 'JobBase.id');

  @override
  String get id {
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$idAtom);
    super.id = value;
    _$idAtom.reportChanged();
  }

  final _$titleAtom = Atom(name: 'JobBase.title');

  @override
  String get title {
    _$titleAtom.reportObserved();
    return super.title;
  }

  @override
  set title(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$titleAtom);
    super.title = value;
    _$titleAtom.reportChanged();
  }

  final _$descriptionAtom = Atom(name: 'JobBase.description');

  @override
  String get description {
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$descriptionAtom);
    super.description = value;
    _$descriptionAtom.reportChanged();
  }

  final _$locationAtom = Atom(name: 'JobBase.location');

  @override
  String get location {
    _$locationAtom.reportObserved();
    return super.location;
  }

  @override
  set location(String value) {
    mainContext.checkIfStateModificationsAreAllowed(_$locationAtom);
    super.location = value;
    _$locationAtom.reportChanged();
  }

  final _$responsibilitiesAtom = Atom(name: 'JobBase.responsibilities');

  @override
  List get responsibilities {
    _$responsibilitiesAtom.reportObserved();
    return super.responsibilities;
  }

  @override
  set responsibilities(List value) {
    mainContext.checkIfStateModificationsAreAllowed(_$responsibilitiesAtom);
    super.responsibilities = value;
    _$responsibilitiesAtom.reportChanged();
  }
}
