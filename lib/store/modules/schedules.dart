import 'package:mobx/mobx.dart';
import '../../models/schedule_state/schedule_state.dart';
import '../../utils/schedule_utils.dart';
import '../../utils/enums.dart';
import '../../models/schedule/schedule.dart';
import '../../repositories/schedule_repository.dart';
part 'schedules.g.dart';

class Schedules = _SchedulesBase with _$Schedules;

abstract class _SchedulesBase with Store {
  @observable
  TargetSchedule _targetSchedule = TargetSchedule.current;
  @computed
  TargetSchedule get targetSchedule => _targetSchedule;

  @observable
  PromiseStatus _status = PromiseStatus.init;

  @computed
  PromiseStatus get status => _status;

  /// the string key value is a compouned of townCode+targetSchedule
  /// - @example: **16001-current** or **7015-next**
  Map<String, ScheduleState> schedules = {};

  @observable
  String errorMessage = "";

  @action
  String? getCurrentScheduleDate({
    required int townCode,
    required TargetSchedule targetSchedule,
  }) {
    final schedule =
        getTownSchedule(townCode: townCode, targetSchedule: targetSchedule);
    final weekStart = schedule?.data?.weekStart;
    final weekEnd = schedule?.data?.weekEnd;
    if (weekStart != null && weekEnd != null) {
      return "$weekStart - $weekEnd";
    } else {
      return null;
    }
  }

  // gets the schedule of the current or next week from the state if it exists
  @action
  ScheduleState? getTownSchedule({
    required int townCode,
    required TargetSchedule targetSchedule,
  }) {
    return schedules[ScheduleUtils.getScheduleKey(
        townCode: townCode, targetSchedule: targetSchedule)];
  }

  /// Stores the schedule in the schedules state, create a new TownSchedule object if the townCode key is absent
  ScheduleState _storeSchedule({
    required int townCode,
    required Schedule? schedule,
    required TargetSchedule targetSchedule,
  }) {
    final townKey = ScheduleUtils.getScheduleKey(
      townCode: townCode,
      targetSchedule: targetSchedule,
    );

    return schedules.update(
      townKey,
      (townSchedule) {
        // if the key already exists, update its value
        townSchedule.data = schedule;
        // return the updated value
        return townSchedule;
      },
      // otherwise, insert a new one
      ifAbsent: () => ScheduleState(schedule),
    );
  }

  void _setStatus(PromiseStatus status) {
    _status = status;
  }

  @action
  void setTargetSchedule(TargetSchedule value) {
    _targetSchedule = value;
  }

  /// Fetches the schedule from the state before attempting to call the api for data
  @action
  Future<ScheduleState?> fetchTownSchedule({
    required int townCode,
    required TargetSchedule targetSchedule,
  }) async {
    try {
      errorMessage = ""; // reset the error message;
      // first check if the value exists in the state before fetching from the api
      final ScheduleState? stateSchedule = getTownSchedule(
        townCode: townCode,
        targetSchedule: targetSchedule,
      );
      if (stateSchedule != null) {
        _setStatus(PromiseStatus.success);
        return stateSchedule;
      }

      // otherwise, the schedule corresponding to the townCode has not been fetched for yet,
      // proceed with api call then
      _setStatus(PromiseStatus.loading);

      final fetchedSchedule = await ScheduleRepository()
          .fetchSchedule(townCode: townCode, targetSchedule: targetSchedule);

      // a null value refer to a not found schedule

      final returnValue = _storeSchedule(
        townCode: townCode,
        schedule: fetchedSchedule,
        targetSchedule: targetSchedule,
      );

      _setStatus(PromiseStatus.success);
      return returnValue;
    } catch (err) {
      errorMessage = err.toString();
      _setStatus(PromiseStatus.error);
      rethrow;
    }
  }
}
