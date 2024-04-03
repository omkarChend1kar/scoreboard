

import 'package:flutter/material.dart';
import 'package:scoreboard/widgets/skewed_rectangle.dart';

class SkewedProgressIndicator extends StatelessWidget {
  final int selectedIndex;
  final int totalItems;

  const SkewedProgressIndicator({
    super.key,
    required this.selectedIndex,
    required this.totalItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        totalItems,
        (index) => SkewedRectangle(
          index: index,
          isSelected: index < selectedIndex,
        ),
      ),
    );
  }
}