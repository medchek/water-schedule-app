import 'package:flutter/material.dart';

class SelectInputBase extends StatelessWidget {
  final double height;
  final double borderRadius;
  final Widget child;
  // static const double _horizontalPadding = 5;

  const SelectInputBase({
    required this.child,
    this.height = 52,
    this.borderRadius = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();
    final theme = Theme.of(context);

    // print(locale);

    return Container(
      alignment: locale == "ar" ? Alignment.centerRight : Alignment.centerLeft,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: theme.canvasColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 17,
            color: theme.shadowColor,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
