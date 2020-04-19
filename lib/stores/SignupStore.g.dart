// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignupStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStore, Store {
  final _$isLoadingAtom = Atom(name: '_SignupStore.isLoading');

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

  final _$signUpAttemptedAtom = Atom(name: '_SignupStore.signUpAttempted');

  @override
  bool get signUpAttempted {
    _$signUpAttemptedAtom.context.enforceReadPolicy(_$signUpAttemptedAtom);
    _$signUpAttemptedAtom.reportObserved();
    return super.signUpAttempted;
  }

  @override
  set signUpAttempted(bool value) {
    _$signUpAttemptedAtom.context.conditionallyRunInAction(() {
      super.signUpAttempted = value;
      _$signUpAttemptedAtom.reportChanged();
    }, _$signUpAttemptedAtom, name: '${_$signUpAttemptedAtom.name}_set');
  }

  final _$successfulSignupAtom = Atom(name: '_SignupStore.successfulSignup');

  @override
  bool get successfulSignup {
    _$successfulSignupAtom.context.enforceReadPolicy(_$successfulSignupAtom);
    _$successfulSignupAtom.reportObserved();
    return super.successfulSignup;
  }

  @override
  set successfulSignup(bool value) {
    _$successfulSignupAtom.context.conditionallyRunInAction(() {
      super.successfulSignup = value;
      _$successfulSignupAtom.reportChanged();
    }, _$successfulSignupAtom, name: '${_$successfulSignupAtom.name}_set');
  }

  final _$postSignupAsyncAction = AsyncAction('postSignup');

  @override
  Future<void> postSignup(
      String email, String password, String username, String passwordConfirm) {
    return _$postSignupAsyncAction.run(
        () => super.postSignup(email, password, username, passwordConfirm));
  }

  final _$_SignupStoreActionController = ActionController(name: '_SignupStore');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SignupStoreActionController.startAction();
    try {
      return super.setLoading(value);
    } finally {
      _$_SignupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},signUpAttempted: ${signUpAttempted.toString()},successfulSignup: ${successfulSignup.toString()}';
    return '{$string}';
  }
}
