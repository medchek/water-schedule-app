import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class SettingsNavigationButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final PageRouteInfo<dynamic> to;
  const SettingsNavigationButton(
      {required this.icon, required this.text, required this.to, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    navigateTo() {
      AutoRouter.of(context).push(to);
    }

    return Column(
      children: [
        Material(
          color: theme.primaryColorLight,
          borderRadius: BorderRadius.circular(6),
          child: InkWell(
            onTap: navigateTo,
            borderRadius: BorderRadius.circular(6),
            splashColor: theme.disabledColor,
            child: Container(
              height: 70,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ), // color: theme.primaryColorLight,
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: theme.primaryColorDark,
                    size: 27,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.primaryColorDark,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: theme.primaryColorDark,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
