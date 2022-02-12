import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25, top: 10),
        child: AutoRouter(),
      ),
    );
  }
}
