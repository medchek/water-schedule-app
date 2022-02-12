import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../settings_screen/settings_screen.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  void _navigateToSettings(BuildContext context) {
    // Navigator.of(context).pushNamed(SettingsScreen.routeName);
    AutoRouter.of(context).pushNamed(SettingsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final smHight = MediaQuery.of(context).size.height <= 640;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "SEAAL",
            style: TextStyle(
              fontWeight: smHight ? FontWeight.w500 : FontWeight.w700,
              fontSize: smHight ? 25 : 30,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          IconButton(
              onPressed: () => _navigateToSettings(context),
              splashRadius: 20,
              iconSize: 30,
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.settings_outlined,
                color: Theme.of(context).primaryColorDark,
              ))
        ],
      ),
    );
  }
}
