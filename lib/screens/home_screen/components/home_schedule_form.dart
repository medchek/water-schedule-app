import 'package:flutter/material.dart';
import 'home_town_selector_input.dart';
import 'home_wilaya_selector_input.dart';

import 'home_fetch_schedule_button.dart';
import '../../../utils/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleForm extends StatelessWidget {
  const ScheduleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmHight = MediaQuery.of(context).size.height <= 640;
    final t = AppLocalizations.of(context)!;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const WilayaSelectorInput(),
            const SizedBox(height: 20),
            const TownSelectorInput(),
            const SizedBox(height: 20),
            Text(
              t.homeNotice,
              style: TextStyle(
                  color: AppColors.appGrey, fontSize: isSmHight ? 10 : 12),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isSmHight ? 20 : 30),
            const FetchScheduleButton(),
          ],
        ),
      ),
    );
  }
}
