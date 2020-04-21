// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignupConfStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupConfStore on _SignupConfStore, Store {
  final _$isLoadingAtom = Atom(name: '_SignupConfStore.isLoading');

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

  final _$signupConfirmedAtom = Atom(name: '_SignupConfStore.signupConfirmed');

  @override
  bool get signupConfirmed {
    _$signupConfirmedAtom.context.enforceReadPolicy(_$signupConfirmedAtom);
    _$signupConfirmedAtom.reportObserved();
    return super.signupConfirmed;
  }

  @override
  set signupConfirmed(bool value) {
    _$signupConfirmedAtom.context.conditionallyRunInAction(() {
      super.signupConfirmed = value;
      _$signupConfirmedAtom.reportChanged();
    }, _$signupConfirmedAtom, name: '${_$signupConfirmedAtom.name}_set');
  }

  final _$confirmAttemptedAtom =
      Atom(name: '_SignupConfStore.confirmAttempted');

  @override
  bool get confirmAttempted {
    _$confirmAttemptedAtom.context.enforceReadPolicy(_$confirmAttemptedAtom);
    _$confirmAttemptedAtom.reportObserved();
    return super.confirmAttempted;
  }

  @override
  set confirmAttempted(bool value) {
    _$confirmAttemptedAtom.context.conditionallyRunInAction(() {
      super.confirmAttempted = value;
      _$confirmAttemptedAtom.reportChanged();
    }, _$confirmAttemptedAtom, name: '${_$confirmAttemptedAtom.name}_set');
  }

  final _$invalidParamsAtom = Atom(name: '_SignupConfStore.invalidParams');

  @override
  bool get invalidParams {
    _$invalidParamsAtom.context.enforceReadPolicy(_$invalidParamsAtom);
    _$invalidParamsAtom.reportObserved();
    return super.invalidParams;
  }

  @override
  set invalidParams(bool value) {
    _$invalidParamsAtom.context.conditionallyRunInAction(() {
      super.invalidParams = value;
      _$invalidParamsAtom.reportChanged();
    }, _$invalidParamsAtom, name: '${_$invalidParamsAtom.name}_set');
  }

  final _$postSignupConfAsyncAction = AsyncAction('postSignupConf');

  @override
  Future<void> postSignupConf(String email, String token) {
    return _$postSignupConfAsyncAction
        .run(() => super.postSignupConf(email, token));
  }

  final _$_SignupConfStoreActionController =
      ActionController(name: '_SignupConfStore');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_SignupConfStoreActionController.startAction();
    try {
      return super.setLoading(value);
    } finally {
      _$_SignupConfStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},signupConfirmed: ${signupConfirmed.toString()},confirmAttempted: ${confirmAttempted.toString()},invalidParams: ${invalidParams.toString()}';
    return '{$string}';
  }
}
