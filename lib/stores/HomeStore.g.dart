// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$isLoadingAtom = Atom(name: '_HomeStore.isLoading');

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

  final _$islandListAtom = Atom(name: '_HomeStore.islandList');

  @override
  List<IslandListing> get islandList {
    _$islandListAtom.context.enforceReadPolicy(_$islandListAtom);
    _$islandListAtom.reportObserved();
    return super.islandList;
  }

  @override
  set islandList(List<IslandListing> value) {
    _$islandListAtom.context.conditionallyRunInAction(() {
      super.islandList = value;
      _$islandListAtom.reportChanged();
    }, _$islandListAtom, name: '${_$islandListAtom.name}_set');
  }

  final _$getIslandsAsyncAction = AsyncAction('getIslands');

  @override
  Future<void> getIslands() {
    return _$getIslandsAsyncAction.run(() => super.getIslands());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_HomeStoreActionController.startAction();
    try {
      return super.setLoading(value);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'isLoading: ${isLoading.toString()},islandList: ${islandList.toString()}';
    return '{$string}';
  }
}
