import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/entities/predictions.dart';
import 'package:scoreboard/states/cubit/scoreboard_cubit.dart';
import 'package:scoreboard/widgets/runs_predictions_widget.dart';
import 'package:scoreboard/widgets/score_input_widget.dart';

class WicketsPredictionWidget extends StatefulWidget {
  final TextEditingController totalWicketsController;
  final TextEditingController caughtController;
  final TextEditingController bowledController;
  final TextEditingController lbwController;
  final TextEditingController runOutController;
  final TextEditingController stampedController;
  const WicketsPredictionWidget({
    super.key,
    required this.totalWicketsController,
    required this.caughtController,
    required this.bowledController,
    required this.lbwController,
    required this.runOutController,
    required this.stampedController,
  });

  @override
  State<WicketsPredictionWidget> createState() =>
      _WicketsPredictionWidgetState();
}

class _WicketsPredictionWidgetState extends State<WicketsPredictionWidget> {
  final FocusNode totalWicketsNode = FocusNode();
  final FocusNode caughtNode = FocusNode();
  final FocusNode bowledNode = FocusNode();
  final FocusNode lbwNode = FocusNode();
  final FocusNode runOutNode = FocusNode();
  final FocusNode stumpedNode = FocusNode();

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
                predictionsCat: PredictionCategory.totalWickets,
                focusNode: totalWicketsNode,
                scoreType: 'Total WICKETS',
                scroeTextController: widget.totalWicketsController,
                forceBoxDecoration: true,
              ),
              Divider(
                height: 35,
                color: colorScheme.surface,
              ),
              PredictionCategoryHeaderWidget(
                headerText: 'Add any 3',
                helpText: 'You can only predict 3',
                textTheme: textTheme,
                colorScheme: colorScheme,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.caught,
                focusNode: caughtNode,
                scoreType: 'Caught',
                scroeTextController: widget.caughtController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.bowled,
                focusNode: bowledNode,
                scoreType: 'Bowled',
                scroeTextController: widget.bowledController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.lbws,
                focusNode: lbwNode,
                scoreType: 'LBW',
                scroeTextController: widget.lbwController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.runOuts,
                focusNode: runOutNode,
                scoreType: 'Run Out',
                scroeTextController: widget.runOutController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.stumped,
                focusNode: stumpedNode,
                scoreType: 'Stumped',
                scroeTextController: widget.stampedController,
              ),
            ],
          );
        },
      ),
    );
  }
}
