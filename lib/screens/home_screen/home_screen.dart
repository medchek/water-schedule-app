import 'package:flutter/material.dart';
import '../../widgets/bottom_illustration.dart';
import 'components/home_schedule_form.dart';

import './components/home_header.dart';
import 'components/home_logo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: BottomIllustration(),
            ),
            Column(
              children: const [
                Header(),
                HomeLogo(),
                ScheduleForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
