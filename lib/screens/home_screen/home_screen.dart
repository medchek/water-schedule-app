import 'package:flutter/material.dart';
import 'components/home_schedule_form.dart';

import './components/home_header.dart';
import 'components/home_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";

  String _getButtomImageAssetName(
      {required BuildContext context, required bool isWideScreen}) {
    final Brightness appTheme = Theme.of(context).brightness;

    if (isWideScreen) {
      return "waves-bg-r.png";
    } else {
      if (appTheme == Brightness.light) {
        return "waves-bg.png";
      } else {
        return "waves-bg-dark.png";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 400;
    final String bgBottomImage = _getButtomImageAssetName(
      context: context,
      isWideScreen: isWideScreen,
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: const [
                Header(),
                HomeLogo(),
                ScheduleForm(),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    repeat: isWideScreen
                        ? ImageRepeat.repeatX
                        : ImageRepeat.noRepeat,
                    image: AssetImage("assets/images/$bgBottomImage"),
                    fit: isWideScreen ? BoxFit.contain : BoxFit.cover,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
