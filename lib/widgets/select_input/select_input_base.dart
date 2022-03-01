import 'package:flutter/material.dart';

class SelectInputBase extends StatelessWidget {
  final double height;
  final double borderRadius;
  final bool ripple;
  final Widget child;
  // static const double _horizontalPadding = 5;

  const SelectInputBase({
    required this.child,
    this.height = 52,
    this.borderRadius = 10,
    this.ripple = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String locale = Localizations.localeOf(context).toString();
    final theme = Theme.of(context);

    // print(locale);

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        // color: theme.canvasColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 17,
            color: theme.shadowColor,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: theme.canvasColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: ripple ? () {} : null,
          splashColor: theme.splashColor,
          highlightColor: theme.canvasColor.withOpacity(.5),
          enableFeedback: true,
          child: Container(
            alignment:
                locale == "ar" ? Alignment.centerRight : Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: height,
            // width: double.infinity,
            // alignment: Alignment.center,
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    );
  }
}
