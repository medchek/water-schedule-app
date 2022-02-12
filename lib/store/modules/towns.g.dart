// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'towns.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Towns on _TownsBase, Store {
  Computed<int?>? _$selectedTownComputed;

  @override
  int? get selectedTown =>
      (_$selectedTownComputed ??= Computed<int?>(() => super.selectedTown,
              name: '_TownsBase.selectedTown'))
          .value;
  Computed<PromiseStatus>? _$statusComputed;

  @override
  PromiseStatus get status =>
      (_$statusComputed ??= Computed<PromiseStatus>(() => super.status,
              name: '_TownsBase.status'))
          .value;

  final _$_selectedTownCodeAtom = Atom(name: '_TownsBase._selectedTownCode');

  @override
  int? get _selectedTownCode {
    _$_selectedTownCodeAtom.reportRead();
    return super._selectedTownCode;
  }

  @override
  set _selectedTownCode(int? value) {
    _$_selectedTownCodeAtom.reportWrite(value, super._selectedTownCode, () {
      super._selectedTownCode = value;
    });
  }

  final _$_statusAtom = Atom(name: '_TownsBase._status');

  @override
  PromiseStatus get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(PromiseStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  final _$townsAtom = Atom(name: '_TownsBase.towns');

  @override
  Map<int, List<Town>> get towns {
    _$townsAtom.reportRead();
    return super.towns;
  }

  @override
  set towns(Map<int, List<Town>> value) {
    _$townsAtom.reportWrite(value, super.towns, () {
      super.towns = value;
    });
  }

  final _$fetchTownsAsyncAction = AsyncAction('_TownsBase.fetchTowns');

  @override
  Future<List<Town>> fetchTowns(int wilayaCode) {
    return _$fetchTownsAsyncAction.run(() => super.fetchTowns(wilayaCode));
  }

  final _$_TownsBaseActionController = ActionController(name: '_TownsBase');

  @override
  Town? getTown({required int wilayaCode, required int townCode}) {
    final _$actionInfo =
        _$_TownsBaseActionController.startAction(name: '_TownsBase.getTown');
    try {
      return super.getTown(wilayaCode: wilayaCode, townCode: townCode);
    } finally {
      _$_TownsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<Town>? getWilayaTowns({required int wilayaCode}) {
    final _$actionInfo = _$_TownsBaseActionController.startAction(
        name: '_TownsBase.getWilayaTowns');
    try {
      return super.getWilayaTowns(wilayaCode: wilayaCode);
    } finally {
      _$_TownsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedTown(int townCode) {
    final _$actionInfo = _$_TownsBaseActionController.startAction(
        name: '_TownsBase.setSelectedTown');
    try {
      return super.setSelectedTown(townCode);
    } finally {
      _$_TownsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
towns: ${towns},
selectedTown: ${selectedTown},
status: ${status}
    ''';
  }
}
