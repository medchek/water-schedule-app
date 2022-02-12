import 'package:mobx/mobx.dart';
import '../../utils/enums.dart';
import '../../models/wilaya/wilaya.dart';
import '../../repositories/wilayas_repository.dart';
part 'wilayas.g.dart';

class Wilayas = _WilayasBase with _$Wilayas;

abstract class _WilayasBase with Store {
  @observable
  int? selectedWilaya;

  @observable
  PromiseStatus _status = PromiseStatus.init;

  @observable
  List<Wilaya> wilayaList = [];

  String _errorMessage = "";
  String get errorMessage => _errorMessage;

  @action
  Wilaya? getWilaya(int wilayaCode) {
    return wilayaList.firstWhere((wilaya) => wilaya.code == wilayaCode);
  }

  @computed
  PromiseStatus get status => _status;

  @computed
  List<Wilaya> get getAllWilayas => wilayaList;

  void _setStatus(PromiseStatus status) {
    _status = status;
  }

  @action
  void setSelectedWilaya(int wilayaCode) {
    selectedWilaya = wilayaCode;
  }

  @action
  Future<List<Wilaya>> fetchWilayas() async {
    try {
      _errorMessage = "";

      if (wilayaList.isNotEmpty) {
        _setStatus(PromiseStatus.success);
        return wilayaList;
      }
      _setStatus(PromiseStatus.loading);
      final fetchedWilayas = await WilayasRepository().fetchAllWilayas();
      wilayaList.addAll(fetchedWilayas);
      _setStatus(PromiseStatus.success);

      return fetchedWilayas;
    } catch (err) {
      _errorMessage = err.toString();
      _setStatus(PromiseStatus.error);
      rethrow;
    }
  }
}
