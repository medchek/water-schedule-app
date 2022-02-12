import 'package:mobx/mobx.dart';
import 'modules/schedules.dart';
import 'modules/wilayas.dart';
import 'modules/towns.dart';
import 'modules/ui.dart';

// Include generated file
part 'app_store.g.dart';

// This is the class used by rest of your codebase
class AppStore = _AppStore with _$AppStore;

// The store-class
abstract class _AppStore with Store {
  final ui = Ui();
  final wilayas = Wilayas();
  final towns = Towns();
  final scheuldes = Schedules();
}
