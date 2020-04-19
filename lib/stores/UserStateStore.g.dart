// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserStateStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStateStore on _UserStateStore, Store {
  final _$loggedInAtom = Atom(name: '_UserStateStore.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.context.enforceReadPolicy(_$loggedInAtom);
    _$loggedInAtom.reportObserved();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.context.conditionallyRunInAction(() {
      super.loggedIn = value;
      _$loggedInAtom.reportChanged();
    }, _$loggedInAtom, name: '${_$loggedInAtom.name}_set');
  }

  final _$_UserStateStoreActionController =
      ActionController(name: '_UserStateStore');

  @override
  void setLoggedIn(bool value) {
    final _$actionInfo = _$_UserStateStoreActionController.startAction();
    try {
      return super.setLoggedIn(value);
    } finally {
      _$_UserStateStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'loggedIn: ${loggedIn.toString()}';
    return '{$string}';
  }
}
