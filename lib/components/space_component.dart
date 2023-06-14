import 'package:flutter/material.dart';

class SpacerComponent extends StatelessWidget {
  final double size;
  final bool isFull;
  final bool isHorizontal;


  const SpacerComponent({
    Key? key,
    this.size = 16,
    this.isFull = false,
    this.isHorizontal = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isFull == true) {
      return const Spacer();
    }

    return SizedBox(
      height: size,
      width: isHorizontal ? size : null,
    );
  }
}
