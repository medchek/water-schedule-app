import 'package:flutter/material.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.34,
      // width: MediaQuery.of(context).size.width * 0.7,
      child: Center(
        child: AspectRatio(
          aspectRatio: 3 / 3,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
