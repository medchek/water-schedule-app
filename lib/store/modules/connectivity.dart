import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  @observable
  String _lastVisitedPage = "";

  String get lastVisitedPage => _lastVisitedPage;

  bool get isHistoryEmpty => _lastVisitedPage.isEmpty;

  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
      ObservableStream(Connectivity().onConnectivityChanged);

  @action
  setLastVisited(String lastPage) {
    _lastVisitedPage = lastPage;
  }

  @action
  resetLastVisitedPage() {
    _lastVisitedPage = "";
  }

  /// Redirect to a route and registers the last page in the history
  /// so that it can be returned to when the connectivity is back.
  @action
  Future<void> redirectToRoute({
    required BuildContext context,
    required String routeName,
  }) async {
    // set the last visited page as history before pushing the new one
    final routeBeforePush = AutoRouter.of(context).current.name;

    await AutoRouter.of(context).pushNamed(routeName);
    // when the navigation succeeds, set the last route name in the history
    _lastVisitedPage = routeBeforePush;
  }

  void dispose() {}
}
