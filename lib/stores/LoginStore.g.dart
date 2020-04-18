// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$isLoadingAtom = Atom(name: '_LoginStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.context.enforceReadPolicy(_$isLoadingAtom);
    _$isLoadingAtom.reportObserved();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.context.conditionallyRunInAction(() {
      super.isLoading = value;
      _$isLoadingAtom.reportChanged();
    }, _$isLoadingAtom, name: '${_$isLoadingAtom.name}_set');
  }

  final _$loggedInAtom = Atom(name: '_LoginStore.loggedIn');

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

  final _$failedLoginAtom = Atom(name: '_LoginStore.failedLogin');

  @override
  bool get failedLogin {
    _$failedLoginAtom.context.enforceReadPolicy(_$failedLoginAtom);
    _$failedLoginAtom.reportObserved();
    return super.failedLogin;
  }

  @override
  set failedLogin(bool value) {
    _$failedLoginAtom.context.conditionallyRunInAction(() {
      super.failedLogin = value;
      _$failedLoginAtom.reportChanged();
    }, _$failedLoginAtom, name: '${_$failedLoginAtom.name}_set');
  }

  final _$postLoginAsyncAction = AsyncAction('postLogin');

  @override
  Future<void> postLogin(String email, String password) {
    return _$postLoginAsyncAction.run(() => super.postLogin(email, password));
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_LoginStoreActionController.startAction();
    try {
      return super.setLoading(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},loggedIn: ${loggedIn.toString()},failedLogin: ${failedLogin.toString()}';
    return '{$string}';
  }
}
