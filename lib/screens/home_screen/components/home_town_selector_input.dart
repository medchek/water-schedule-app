import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/towns.dart';
import '../../../store/modules/wilayas.dart';
import '../../../utils/enums.dart';
import '../../../widgets/select_input/select_input.dart';
import '../../../widgets/select_input/select_input_error.dart';
import '../../../widgets/select_input/select_input_loading.dart';
import '../../../widgets/select_input/select_input_disabled.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TownSelectorInput extends StatelessWidget {
  const TownSelectorInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final wilayaStore = Provider.of<Wilayas>(context);
    final townStore = Provider.of<Towns>(context);

    return Observer(builder: (_) {
      if (wilayaStore.selectedWilaya != null) {
        final townsList =
            townStore.getWilayaTowns(wilayaCode: wilayaStore.selectedWilaya!);

        switch (townStore.status) {
          case PromiseStatus.init:
            return SelectInput(
              hint: t.townInputHint,
              items: const [],
            );
          case PromiseStatus.loading:
            return const SelectInputLoading();
          case PromiseStatus.error:
            return SelectInputError(
              // error: townStore.errorMessage,
              error: t.unreachableServer,
              retry: () => townStore.fetchTowns(wilayaStore.selectedWilaya!),
            );
          case PromiseStatus.success:
            return SelectInput(
              items: townsList,
              value: townStore.selectedTown,
              onPress: townStore.setSelectedTown,
              hint: t.townInputHint,
              displayCode: false,
            );
        }
      } else {
        return SelectInputDisabled(
          message: t.townInputDisabledText,
        );
      }
    });
  }
}
