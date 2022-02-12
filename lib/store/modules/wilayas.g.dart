// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wilayas.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Wilayas on _WilayasBase, Store {
  Computed<PromiseStatus>? _$statusComputed;

  @override
  PromiseStatus get status =>
      (_$statusComputed ??= Computed<PromiseStatus>(() => super.status,
              name: '_WilayasBase.status'))
          .value;
  Computed<List<Wilaya>>? _$getAllWilayasComputed;

  @override
  List<Wilaya> get getAllWilayas => (_$getAllWilayasComputed ??=
          Computed<List<Wilaya>>(() => super.getAllWilayas,
              name: '_WilayasBase.getAllWilayas'))
      .value;

  final _$selectedWilayaAtom = Atom(name: '_WilayasBase.selectedWilaya');

  @override
  int? get selectedWilaya {
    _$selectedWilayaAtom.reportRead();
    return super.selectedWilaya;
  }

  @override
  set selectedWilaya(int? value) {
    _$selectedWilayaAtom.reportWrite(value, super.selectedWilaya, () {
      super.selectedWilaya = value;
    });
  }

  final _$_statusAtom = Atom(name: '_WilayasBase._status');

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

  final _$wilayaListAtom = Atom(name: '_WilayasBase.wilayaList');

  @override
  List<Wilaya> get wilayaList {
    _$wilayaListAtom.reportRead();
    return super.wilayaList;
  }

  @override
  set wilayaList(List<Wilaya> value) {
    _$wilayaListAtom.reportWrite(value, super.wilayaList, () {
      super.wilayaList = value;
    });
  }

  final _$fetchWilayasAsyncAction = AsyncAction('_WilayasBase.fetchWilayas');

  @override
  Future<List<Wilaya>> fetchWilayas() {
    return _$fetchWilayasAsyncAction.run(() => super.fetchWilayas());
  }

  final _$_WilayasBaseActionController = ActionController(name: '_WilayasBase');

  @override
  Wilaya? getWilaya(int wilayaCode) {
    final _$actionInfo = _$_WilayasBaseActionController.startAction(
        name: '_WilayasBase.getWilaya');
    try {
      return super.getWilaya(wilayaCode);
    } finally {
      _$_WilayasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedWilaya(int wilayaCode) {
    final _$actionInfo = _$_WilayasBaseActionController.startAction(
        name: '_WilayasBase.setSelectedWilaya');
    try {
      return super.setSelectedWilaya(wilayaCode);
    } finally {
      _$_WilayasBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedWilaya: ${selectedWilaya},
wilayaList: ${wilayaList},
status: ${status},
getAllWilayas: ${getAllWilayas}
    ''';
  }
}
