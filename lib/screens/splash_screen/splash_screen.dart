import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SizedBox(
            width: 200,
            height: 200,
            child: Image.asset("assets/images/logo.png")),
      ),
    );
  }
}
