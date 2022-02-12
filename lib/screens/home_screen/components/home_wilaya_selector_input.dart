import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/towns.dart';
import '../../../utils/enums.dart';
import '../../../widgets/select_input/select_input.dart';
import '../../../widgets/select_input/select_input_error.dart';
import '../../../widgets/select_input/select_input_loading.dart';
import '../../../store/modules/wilayas.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WilayaSelectorInput extends StatelessWidget {
  const WilayaSelectorInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final hint = AppLocalizations.of(context)!.wilayaInputHint;

    final wilayaStore = Provider.of<Wilayas>(context);
    final townStore = Provider.of<Towns>(context);

    void handleOnSelectedWilaya(int wilayaCode) {
      wilayaStore.setSelectedWilaya(wilayaCode);
      townStore.fetchTowns(wilayaCode);
    }

    wilayaStore.fetchWilayas();

    return Observer(builder: (_) {
      switch (wilayaStore.status) {
        case PromiseStatus.init:
          return SelectInput(
            hint: hint,
            items: const [],
          );
        case PromiseStatus.loading:
          return const SelectInputLoading();
        case PromiseStatus.error:
          return SelectInputError(
            // error: wilayaStore.errorMessage,
            error: t.unreachableServer,
            retry: () => wilayaStore.fetchWilayas(),
          );
        case PromiseStatus.success:
          return SelectInput(
            items: wilayaStore.getAllWilayas,
            value: wilayaStore.selectedWilaya,
            onPress: handleOnSelectedWilaya,
            hint: hint,
          );
      }
    });
  }
}
