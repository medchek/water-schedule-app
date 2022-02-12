// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Schedules on _SchedulesBase, Store {
  Computed<TargetSchedule>? _$targetScheduleComputed;

  @override
  TargetSchedule get targetSchedule => (_$targetScheduleComputed ??=
          Computed<TargetSchedule>(() => super.targetSchedule,
              name: '_SchedulesBase.targetSchedule'))
      .value;
  Computed<PromiseStatus>? _$statusComputed;

  @override
  PromiseStatus get status =>
      (_$statusComputed ??= Computed<PromiseStatus>(() => super.status,
              name: '_SchedulesBase.status'))
          .value;

  final _$_targetScheduleAtom = Atom(name: '_SchedulesBase._targetSchedule');

  @override
  TargetSchedule get _targetSchedule {
    _$_targetScheduleAtom.reportRead();
    return super._targetSchedule;
  }

  @override
  set _targetSchedule(TargetSchedule value) {
    _$_targetScheduleAtom.reportWrite(value, super._targetSchedule, () {
      super._targetSchedule = value;
    });
  }

  final _$_statusAtom = Atom(name: '_SchedulesBase._status');

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

  final _$errorMessageAtom = Atom(name: '_SchedulesBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$fetchTownScheduleAsyncAction =
      AsyncAction('_SchedulesBase.fetchTownSchedule');

  @override
  Future<ScheduleState?> fetchTownSchedule(
      {required int townCode, required TargetSchedule targetSchedule}) {
    return _$fetchTownScheduleAsyncAction.run(() => super
        .fetchTownSchedule(townCode: townCode, targetSchedule: targetSchedule));
  }

  final _$_SchedulesBaseActionController =
      ActionController(name: '_SchedulesBase');

  @override
  String? getCurrentScheduleDate(
      {required int townCode, required TargetSchedule targetSchedule}) {
    final _$actionInfo = _$_SchedulesBaseActionController.startAction(
        name: '_SchedulesBase.getCurrentScheduleDate');
    try {
      return super.getCurrentScheduleDate(
          townCode: townCode, targetSchedule: targetSchedule);
    } finally {
      _$_SchedulesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  ScheduleState? getTownSchedule(
      {required int townCode, required TargetSchedule targetSchedule}) {
    final _$actionInfo = _$_SchedulesBaseActionController.startAction(
        name: '_SchedulesBase.getTownSchedule');
    try {
      return super
          .getTownSchedule(townCode: townCode, targetSchedule: targetSchedule);
    } finally {
      _$_SchedulesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTargetSchedule(TargetSchedule value) {
    final _$actionInfo = _$_SchedulesBaseActionController.startAction(
        name: '_SchedulesBase.setTargetSchedule');
    try {
      return super.setTargetSchedule(value);
    } finally {
      _$_SchedulesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
errorMessage: ${errorMessage},
targetSchedule: ${targetSchedule},
status: ${status}
    ''';
  }
}
