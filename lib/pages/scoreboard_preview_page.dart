import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scoreboard/entities/predictions.dart';
import 'package:scoreboard/states/cubit/scoreboard_cubit.dart';
import 'package:scoreboard/widgets/score_box_widget.dart';


class ScoreboardPreviewPage extends StatefulWidget {
  const ScoreboardPreviewPage({super.key});

  @override
  State<ScoreboardPreviewPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ScoreboardPreviewPage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.onPrimary,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Username ',
                  style: textTheme.titleMedium,
                ),
                DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 3),
                    child: Text(
                      'S1',
                      style: textTheme.titleSmall!.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  '1000 pts',
                  style: textTheme.labelLarge!
                      .copyWith(color: colorScheme.surface),
                ),
                Text(
                  '  0 Position',
                  style: textTheme.labelLarge!
                      .copyWith(color: colorScheme.primary),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: colorScheme.onPrimary,
      body: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BlocBuilder<ScoreboardCubit, Predictions>(
              builder: (context, state) {
                final List<Map<String, dynamic>> selections =
                    state.getSelectedPredictions();
                return Table(
                  columnWidths: const {
                    // Adjust the width of each column
                    0: FixedColumnWidth(
                      100,
                    ), // Adjust the width of the first column
                    1: FlexColumnWidth(), // Adjust the width of the second column
                    2: FlexColumnWidth(), // Adjust the width of the third column
                    3: FlexColumnWidth(), // Adjust the width of the fourth column
                  },
                  defaultColumnWidth: const FlexColumnWidth(10),
                  // border: TableBorder.all(color: colorScheme.surface),

                  border: TableBorder.symmetric(
                    inside: BorderSide.none,
                    outside: BorderSide(
                        color: colorScheme.surface,
                        width: 1), // Border for outside edges
                  ),
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: [
                    // Table header
                    TableRow(
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                      ),
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '',
                              style: textTheme.titleSmall,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Selection/Score',
                              style: textTheme.titleSmall,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Points',
                              style: textTheme.titleSmall,
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Rank',
                              style: textTheme.titleSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Table body

                    ...selections.map(
                      (e) {
                        return TableRow(children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Text(toBeginningOfSentenceCase(e['catName'])),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ScoreBoxWidget(
                                colorScheme: colorScheme,
                                predictedScore: e['catValue'] ?? 0,
                                actualScore: 0,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ScoreBoxWidget(
                                colorScheme: colorScheme,
                                predictedScore: 0,
                                actualScore: 0,
                                points: 0,
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ScoreBoxWidget(
                                colorScheme: colorScheme,
                                predictedScore: 0,
                                actualScore: 0,
                                points: 0,
                              ),
                            ),
                          ),
                        ]);
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}


