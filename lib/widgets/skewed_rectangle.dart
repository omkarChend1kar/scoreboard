import 'package:flutter/material.dart';

class SkewedRectangle extends StatelessWidget {
  final int index;
  final bool isSelected;

  const SkewedRectangle({
    super.key,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.skewX(-0.1),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: SizedBox(
          width: 18,
          height: 28,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color.fromARGB(255, 4, 156, 161)
                  : Colors.grey,
              // borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}