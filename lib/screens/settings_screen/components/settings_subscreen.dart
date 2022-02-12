import 'package:flutter/material.dart';

class SettingsSubScreen extends StatelessWidget {
  final String text;
  final List<Widget> children;
  const SettingsSubScreen(
      {required this.text, required this.children, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.background,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                color: theme.primaryColorDark,
                fontSize: 17,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 15),
          Column(
            children: children,
          )
        ],
      ),
    );
  }
}
