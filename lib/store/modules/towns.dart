import 'package:mobx/mobx.dart';
import '../../utils/enums.dart';
import '../../repositories/towns_repository.dart';
import '../../models/town/town.dart';
part 'towns.g.dart';

class Towns = _TownsBase with _$Towns;

abstract class _TownsBase with Store {
  @observable
  int? _selectedTownCode;
  @computed
  int? get selectedTown => _selectedTownCode;

  @observable
  PromiseStatus _status = PromiseStatus.init;

  String errorMessage = "";

  @computed
  PromiseStatus get status => _status;

  @observable
  Map<int, List<Town>> towns = {};

  // retrives a single town from the state
  @action
  Town? getTown({required int wilayaCode, required int townCode}) {
    return towns[wilayaCode]?.firstWhere((town) => town.code == townCode);
  }

  // retrives the list of towns of the given wilaya
  @action
  List<Town>? getWilayaTowns({required int wilayaCode}) {
    return towns[wilayaCode];
  }

  void _setStatus(PromiseStatus status) {
    _status = status;
  }

  @action
  void setSelectedTown(int townCode) {
    _selectedTownCode = townCode;
  }

  void resetSelectedTown() {
    _selectedTownCode = null;
  }

  @action
  Future<List<Town>> fetchTowns(int wilayaCode) async {
    try {
      resetSelectedTown();
      errorMessage = "";

      final List<Town>? stateTowns = getWilayaTowns(wilayaCode: wilayaCode);
      if (stateTowns != null) {
        _setStatus(PromiseStatus.success);
        return stateTowns;
      }

      _setStatus(PromiseStatus.loading);
      final fetchedTowns =
          await TownsRepository().fetchTownsByWilayaId(wilayaCode.toString());
      towns[wilayaCode] = fetchedTowns;

      _setStatus(PromiseStatus.success);

      return fetchedTowns;
    } catch (err) {
      errorMessage = err.toString();
      _setStatus(PromiseStatus.error);
      rethrow;
    }
  }
}
