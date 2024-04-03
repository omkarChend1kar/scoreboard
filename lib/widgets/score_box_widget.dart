import 'package:flutter/material.dart';

class ScoreBoxWidget extends StatelessWidget {
  const ScoreBoxWidget({
    super.key,
    required this.colorScheme,
    required this.predictedScore,
    required this.actualScore,
    this.points,
  });

  final ColorScheme colorScheme;
  final int predictedScore;
  final int actualScore;
  final int? points;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: colorScheme.secondary,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: points != null
            ? Center(
                child: Text(
                  points!.toString(),
                  style: TextStyle(
                    color: colorScheme.onSecondary,
                  ),
                ),
              )
            : Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: '$predictedScore / '),
                      TextSpan(
                        text: actualScore.toString(),
                        style: TextStyle(
                          color: colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}