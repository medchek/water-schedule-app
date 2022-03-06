import 'package:flutter/material.dart';

class BottomIllustration extends StatelessWidget {
  const BottomIllustration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 400;
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    final String bgBottomImage = isWideScreen
        ? isDarkTheme
            ? "waves-bg-dark-r"
            : "waves-bg-r"
        : isDarkTheme
            ? "waves-bg-dark"
            : "waves-bg";

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .15,
      decoration: BoxDecoration(
        image: DecorationImage(
          repeat: isWideScreen ? ImageRepeat.repeatX : ImageRepeat.noRepeat,
          image: AssetImage("assets/images/$bgBottomImage.png"),
          fit: isWideScreen ? BoxFit.contain : BoxFit.cover,
        ),
      ),
    );
  }
}
