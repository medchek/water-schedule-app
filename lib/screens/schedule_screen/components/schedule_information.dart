import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart';
import '../../../store/modules/towns.dart';
import '../../../store/modules/wilayas.dart';

// import '../../../provides/selected_wilaya_provider.dart';

class ScheduleInformation extends StatelessWidget {
  const ScheduleInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();
    final bool isSmHight = MediaQuery.of(context).size.height <= 640;

    final bool isArLocale = locale == "ar";
    final wilayaStore = Provider.of<Wilayas>(context);
    final townStore = Provider.of<Towns>(context);
    final theme = Theme.of(context);

    return Container(
      alignment: isArLocale ? Alignment.centerRight : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Observer(builder: (_) {
        final wilayaCode = wilayaStore.selectedWilaya;
        final townCode = townStore.selectedTown;
        final wilaya = wilayaStore.getWilaya(wilayaCode!);
        final town =
            townStore.getTown(wilayaCode: wilayaCode, townCode: townCode!);

        final wilayaName =
            (isArLocale ? wilaya?.arName : wilaya?.name) ?? "no-wilaya";
        final townName = (isArLocale ? town?.arName : town?.name) ?? "no-town";

        return Text(
          // "Gué de constantine - $wilayaName",
          "${StringUtils.capitalize(townName)} - $wilayaName",
          style: TextStyle(
            color: theme.primaryColorDark,
            fontWeight: FontWeight.w500,
            fontSize: isSmHight ? 17 : 20,
          ),
        );
      }),
      // Text(
      //   "19/10/2021 - 26/10/2021",
      //   style: TextStyle(
      //     color: theme.primaryColor,
      //     fontWeight: FontWeight.w400,
      //     fontSize: 14,
      //   ),
      // ),
    );
  }
}
