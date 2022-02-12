import 'package:flutter/material.dart';
import 'select_input_base.dart';

class SelectInputLoading extends StatelessWidget {
  final double height;
  final double borderRadius;
  // static const double _horizontalPadding = 5;

  const SelectInputLoading({Key? key, this.height = 52, this.borderRadius = 10})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SelectInputBase(
      child: SizedBox(
        child: CircularProgressIndicator(
          strokeWidth: 3,
        ),
        height: 20,
        width: 20,
      ),
    );
  }
}
