import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'select_input_base.dart';

class SelectInputDisabled extends StatelessWidget {
  final String message;
  const SelectInputDisabled({required this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectInputBase(
      child: Text(
        message,
        style: const TextStyle(
          color: AppColors.appGrey,
        ),
      ),
    );
  }
}
