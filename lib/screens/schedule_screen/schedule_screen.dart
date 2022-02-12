import 'package:flutter/material.dart';
import '../../widgets/screen_header.dart';
import 'components/schedule_content.dart';
import 'components/schedule_information.dart';
// import '../../utils/schedule_screen_arguments.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  static const routeName = "/schedule";

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    // final bool isWideScreen = MediaQuery.of(context).size.width > 400;

    // final String bgBottomImage =
    //     isWideScreen ? "schedule-waves-bg-r.png" : "schedule-waves-bg.png";
    // final args =
    //     ModalRoute.of(context)!.settings.arguments as ScheduleScreenArguments;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //       width: double.infinity,
            //       // schedule-waves-bg
            //       height: MediaQuery.of(context).size.height * .1,
            //       color: Colors.red,
            //       decoration: BoxDecoration(
            //         image: DecorationImage(
            //           repeat: isWideScreen
            //               ? ImageRepeat.repeatX
            //               : ImageRepeat.noRepeat,
            //           image: AssetImage("assets/images/$bgBottomImage"),
            //           fit: isWideScreen ? BoxFit.contain : BoxFit.cover,
            //         ),
            //       )),
            // ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScreenHeader(headerText: t.schedule),
                const ScheduleInformation(),
                const ScheduleContent(),
              ],
            ),
            //BG IMAGE
          ],
        ),
      ),
    );
  }
}
