import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/entities/predictions.dart';
import 'package:scoreboard/states/cubit/scoreboard_cubit.dart';
import 'package:scoreboard/widgets/runs_predictions_widget.dart';
import 'package:scoreboard/widgets/score_input_widget.dart';

class ExtrasPredictionsWidget extends StatefulWidget {
  final TextEditingController totalExtrasController;
  final TextEditingController widesController;
  final TextEditingController noBallController;
  final TextEditingController legByController;

  const ExtrasPredictionsWidget({
    super.key,
    required this.totalExtrasController,
    required this.widesController,
    required this.noBallController,
    required this.legByController,
  });

  @override
  State<ExtrasPredictionsWidget> createState() =>
      _ExtrasPredictionsWidgetState();
}

class _ExtrasPredictionsWidgetState extends State<ExtrasPredictionsWidget> {
  final FocusNode totalExtrasNode = FocusNode();
  final FocusNode widesNode = FocusNode();
  final FocusNode noBallNode = FocusNode();
  final FocusNode legByeNode = FocusNode();

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
                predictionsCat: PredictionCategory.totalExtras,
                focusNode: totalExtrasNode,
                scoreType: 'Total EXTRAS',
                scroeTextController: widget.totalExtrasController,
                forceBoxDecoration: true,
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
                predictionsCat: PredictionCategory.wides,
                focusNode: widesNode,
                scoreType: 'Wide',
                scroeTextController: widget.widesController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.noBalls,
                focusNode: noBallNode,
                scoreType: 'No Ball',
                scroeTextController: widget.noBallController,
              ),
              const SizedBox(
                height: 15,
              ),
              ScoreInputWidget(
                twerveSelectionsDone: twelweSelectionDone,
                predictionsCat: PredictionCategory.legBies,
                focusNode: legByeNode,
                scoreType: 'Leg By',
                scroeTextController: widget.legByController,
              ),
            ],
          );
        },
      ),
    );
  }
}
