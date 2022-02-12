import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'select_input_base.dart';

class SelectInputError extends StatelessWidget {
  final double height;
  final double borderRadius;
  final String error;
  final VoidCallback? retry;
  // static const double _horizontalPadding = 5;

  const SelectInputError({
    required this.error,
    this.retry,
    this.height = 52,
    this.borderRadius = 10,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectInputBase(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              error,
              style: const TextStyle(
                color: AppColors.appError,
              ),
            ),
          ),
          if (retry != null)
            Material(
              color: Colors.transparent,
              child: InkWell(
                child: const Icon(
                  Icons.replay,
                  size: 30,
                  color: AppColors.appError,
                ),
                borderRadius: BorderRadius.circular(50),
                onTap: retry,
              ),
            ),
        ],
      ),
    );
  }
}
