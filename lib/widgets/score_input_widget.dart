import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/states/cubit/scoreboard_cubit.dart';

enum PredictionCategory {
  totalExtras,
  wides,
  noBalls,
  legBies,
  totalRuns,
  highestIndScore,
  dots,
  ones,
  twos,
  fours,
  sixes,
  totalWickets,
  stumped,
  caught,
  bowled,
  lbws,
  runOuts,
}

class ScoreInputWidget extends StatelessWidget {
  final String scoreType;
  final TextEditingController scroeTextController;
  final FocusNode focusNode;
  final bool forceBoxDecoration;
  final PredictionCategory predictionsCat;
  final bool twerveSelectionsDone;
  const ScoreInputWidget({
    super.key,
    required this.scoreType,
    required this.scroeTextController,
    required this.focusNode,
    this.forceBoxDecoration = false,
    required this.predictionsCat,
    required this.twerveSelectionsDone,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return DecoratedBox(
      decoration: focusNode.hasFocus || forceBoxDecoration
          ? BoxDecoration(
              backgroundBlendMode: BlendMode.softLight,
              color: colorScheme.tertiary.withOpacity(1),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(
                color: colorScheme.surface,
                width: 0.5,
              ),
            )
          : const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(
                  scoreType,
                  style: textTheme.titleMedium!.copyWith(
                    fontSize: 15,
                    color: textTheme.titleMedium!.color!.withOpacity(
                      0.9,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  // height: 10,
                  width: 110,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^[1-9]\d*$'))
                    ],

                    onChanged: (value) {
                      if (!twerveSelectionsDone) {
                        context.read<ScoreboardCubit>().updateScoreboard(
                              totalRuns:
                                  predictionsCat == PredictionCategory.totalRuns
                                      ? int.tryParse(value)
                                      : null,
                              bowled:
                                  predictionsCat == PredictionCategory.bowled
                                      ? int.tryParse(value)
                                      : null,
                              caught:
                                  predictionsCat == PredictionCategory.caught
                                      ? int.tryParse(value)
                                      : null,
                              dots: predictionsCat == PredictionCategory.dots
                                  ? int.tryParse(value)
                                  : null,
                              fours: predictionsCat == PredictionCategory.fours
                                  ? int.tryParse(value)
                                  : null,
                              sixes: predictionsCat == PredictionCategory.sixes
                                  ? int.tryParse(value)
                                  : null,
                              highestIndScore: predictionsCat ==
                                      PredictionCategory.highestIndScore
                                  ? int.tryParse(value)
                                  : null,
                              lbws: predictionsCat == PredictionCategory.lbws
                                  ? int.tryParse(value)
                                  : null,
                              legBies:
                                  predictionsCat == PredictionCategory.legBies
                                      ? int.tryParse(value)
                                      : null,
                              noBalls:
                                  predictionsCat == PredictionCategory.noBalls
                                      ? int.tryParse(value)
                                      : null,
                              ones: predictionsCat == PredictionCategory.ones
                                  ? int.tryParse(value)
                                  : null,
                              runOuts:
                                  predictionsCat == PredictionCategory.runOuts
                                      ? int.tryParse(value)
                                      : null,
                              totalExtras: predictionsCat ==
                                      PredictionCategory.totalExtras
                                  ? int.tryParse(value)
                                  : null,
                              totalWickets: predictionsCat ==
                                      PredictionCategory.totalWickets
                                  ? int.tryParse(value)
                                  : null,
                              twos: predictionsCat == PredictionCategory.twos
                                  ? int.tryParse(value)
                                  : null,
                              wides: predictionsCat == PredictionCategory.wides
                                  ? int.tryParse(value)
                                  : null,
                              stumped:
                                  predictionsCat == PredictionCategory.stumped
                                      ? int.tryParse(value)
                                      : null,
                            );
                      }
                    },
                    onTap: () {
                      if (twerveSelectionsDone) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                const Text('Only 12 selection are allowed'),
                            // duration:
                            //     const Duration(seconds: 3), // Adjust the duration as needed
                            action: SnackBarAction(
                              label: 'Close',
                              onPressed: () {
                                // Perform some action when the user presses the action button
                              },
                            ),
                          ),
                        );
                      }
                    },
                    // enabled: !twerveSelectionsDone,
                    focusNode: focusNode,
                    textAlign: TextAlign.center,
                    controller: scroeTextController,
                    decoration: InputDecoration(
                      hintText: '-',
                      hintStyle: const TextStyle(color: Colors.white),
                      fillColor: colorScheme.secondary,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      filled: true,
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (scroeTextController.text.isEmpty ||
                        (int.tryParse(scroeTextController.text) ?? 0) < 1) {
                      if (!twerveSelectionsDone) {
                        scroeTextController.text =
                            (int.tryParse(scroeTextController.text) ?? 0 + 1)
                                .toString();
                        context.read<ScoreboardCubit>().updateScoreboard(
                              totalRuns: predictionsCat ==
                                      PredictionCategory.totalRuns
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              bowled: predictionsCat ==
                                      PredictionCategory.bowled
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              caught: predictionsCat ==
                                      PredictionCategory.caught
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              dots: predictionsCat == PredictionCategory.dots
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              fours: predictionsCat == PredictionCategory.fours
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              sixes: predictionsCat == PredictionCategory.sixes
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              highestIndScore: predictionsCat ==
                                      PredictionCategory.highestIndScore
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              lbws: predictionsCat == PredictionCategory.lbws
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              legBies: predictionsCat ==
                                      PredictionCategory.legBies
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              noBalls: predictionsCat ==
                                      PredictionCategory.noBalls
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              ones: predictionsCat == PredictionCategory.ones
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              runOuts: predictionsCat ==
                                      PredictionCategory.runOuts
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              totalExtras: predictionsCat ==
                                      PredictionCategory.totalExtras
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              totalWickets: predictionsCat ==
                                      PredictionCategory.totalWickets
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              twos: predictionsCat == PredictionCategory.twos
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              wides: predictionsCat == PredictionCategory.wides
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                              stumped: predictionsCat ==
                                      PredictionCategory.stumped
                                  ? (int.tryParse(scroeTextController.text) ??
                                      0 + 1)
                                  : null,
                            );
                      }
                    } else {
                      scroeTextController.text =
                          ((int.tryParse(scroeTextController.text) ?? 0) - 1)
                              .toString();

                      context.read<ScoreboardCubit>().updateScoreboard(
                            totalRuns: predictionsCat ==
                                    PredictionCategory.totalRuns
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            bowled: predictionsCat == PredictionCategory.bowled
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            caught: predictionsCat == PredictionCategory.caught
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            dots: predictionsCat == PredictionCategory.dots
                                ? (int.tryParse(scroeTextController.text) ??
                                    0 + 1)
                                : null,
                            fours: predictionsCat == PredictionCategory.fours
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            sixes: predictionsCat == PredictionCategory.sixes
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            highestIndScore: predictionsCat ==
                                    PredictionCategory.highestIndScore
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            lbws: predictionsCat == PredictionCategory.lbws
                                ? (int.tryParse(scroeTextController.text) ??
                                    0 + 1)
                                : null,
                            legBies: predictionsCat ==
                                    PredictionCategory.legBies
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            noBalls: predictionsCat ==
                                    PredictionCategory.noBalls
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            ones: predictionsCat == PredictionCategory.ones
                                ? (int.tryParse(scroeTextController.text) ??
                                    0 + 1)
                                : null,
                            runOuts: predictionsCat ==
                                    PredictionCategory.runOuts
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            totalExtras: predictionsCat ==
                                    PredictionCategory.totalExtras
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            totalWickets: predictionsCat ==
                                    PredictionCategory.totalWickets
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            twos: predictionsCat == PredictionCategory.twos
                                ? (int.tryParse(scroeTextController.text) ??
                                    0 + 1)
                                : null,
                            wides: predictionsCat == PredictionCategory.wides
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                            stumped: predictionsCat ==
                                    PredictionCategory.stumped
                                ? ((int.tryParse(scroeTextController.text) ??
                                        0) -
                                    1)
                                : null,
                          );
                    }
                  },
                  icon: scroeTextController.text.isEmpty
                      ? const Icon(
                          Icons.add_circle_outline,
                        )
                      : const Icon(
                          Icons.remove_circle_outline,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
