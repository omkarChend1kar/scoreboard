import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/entities/predictions.dart';
import 'package:scoreboard/states/cubit/scoreboard_cubit.dart';

import 'package:scoreboard/widgets/score_input_widget.dart';

class RunsPredictionsWidget extends StatefulWidget {
  final TextEditingController totalRunsController;
  final TextEditingController highestIndScoreController =
      TextEditingController();
  final TextEditingController dotsController;
  final TextEditingController onesController;
  final TextEditingController twosController;
  final TextEditingController foursController;
  final TextEditingController sixesController;
  RunsPredictionsWidget({
    super.key,
    required this.totalRunsController,
    required this.dotsController,
    required this.onesController,
    required this.twosController,
    required this.foursController,
    required this.sixesController,
  });

  @override
  State<RunsPredictionsWidget> createState() => _RunsPredictionsWidgetState();
}

class _RunsPredictionsWidgetState extends State<RunsPredictionsWidget> {
  final FocusNode totalRunsNode = FocusNode();
  final FocusNode highestIndScoreNode = FocusNode();
  final FocusNode dotsNode = FocusNode();
  final FocusNode onesNode = FocusNode();
  final FocusNode twosNode = FocusNode();
  final FocusNode foursNode = FocusNode();
  final FocusNode sixesNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: BlocBuilder<ScoreboardCubit, Predictions>(
        builder: (context, state) {
          final selectionsNum = state.getTotalSelections();
          final twelweSelectionDone = selectionsNum >= 12;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mandatory',
                style: textTheme.titleLarge!.copyWith(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.totalRuns,
                focusNode: totalRunsNode,
                scoreType: 'Total RUNS',
                scroeTextController: widget.totalRunsController,
                forceBoxDecoration: true,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.highestIndScore,
                forceBoxDecoration: true,
                focusNode: highestIndScoreNode,
                scoreType: 'Highest Individual Score',
                scroeTextController: widget.highestIndScoreController,
              ),
              Divider(
                height: 35,
                color: colorScheme.surface,
              ),
              PredictionCategoryHeaderWidget(
                headerText: 'Add any 1',
                helpText: 'You can only predict 1',
                textTheme: textTheme,
                colorScheme: colorScheme,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.dots,
                focusNode: dotsNode,
                scoreType: 'Dots',
                scroeTextController: widget.dotsController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.ones,
                focusNode: onesNode,
                scoreType: '1\'s',
                scroeTextController: widget.onesController,
              ),
              Divider(
                height: 35,
                color: colorScheme.surface,
              ),
              PredictionCategoryHeaderWidget(
                headerText: 'Add any 2',
                helpText: 'You can only predict 2',
                textTheme: textTheme,
                colorScheme: colorScheme,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.twos,
                focusNode: twosNode,
                scoreType: '2\'s',
                scroeTextController: widget.twosController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.fours,
                focusNode: foursNode,
                scoreType: '4\'s',
                scroeTextController: widget.foursController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.sixes,
                focusNode: sixesNode,
                scoreType: '6\'s',
                scroeTextController: widget.sixesController,
              ),
            ],
          );
        },
      ),
    );
  }
}

class PredictionCategoryHeaderWidget extends StatefulWidget {
  const PredictionCategoryHeaderWidget({
    super.key,
    required this.textTheme,
    required this.colorScheme,
    required this.headerText,
    required this.helpText,
  });

  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final String headerText;
  final String helpText;

  @override
  State<PredictionCategoryHeaderWidget> createState() =>
      _PredictionCategoryHeaderWidgetState();
}

class _PredictionCategoryHeaderWidgetState
    extends State<PredictionCategoryHeaderWidget> {
  final GlobalKey<TooltipState> tooltipkey = GlobalKey<TooltipState>();
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: widget.headerText,
            style: widget.textTheme.titleLarge!.copyWith(
              fontSize: 18,
            ),
          ),
          WidgetSpan(
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Tooltip(
                key: tooltipkey,
                verticalOffset: 0,
                preferBelow: false,
                triggerMode: TooltipTriggerMode.manual,
                decoration: BoxDecoration(
                  color: widget.colorScheme.secondary,
                  border: Border.all(
                    color: widget.colorScheme.surface,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                richMessage: TextSpan(text: widget.helpText),
                child: InkWell(
                  onTap: () {
                    tooltipkey.currentState?.ensureTooltipVisible();
                  },
                  child: const Icon(
                    Icons.help_outline_rounded,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
