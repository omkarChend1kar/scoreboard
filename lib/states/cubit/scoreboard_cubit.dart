import 'package:bloc/bloc.dart';

import 'package:scoreboard/entities/predictions.dart';



class ScoreboardCubit extends Cubit<Predictions> {
  ScoreboardCubit() : super(const Predictions());

  void updateScoreboard({
    int? totalExtras,
    int? wides,
    int? noBalls,
    int? legBies,
    int? totalRuns,
    int? highestIndScore,
    int? dots,
    int? ones,
    int? twos,
    int? fours,
    int? sixes,
    int? totalWickets,
    int? caught,
    int? bowled,
    int? lbws,
    int? runOuts,
    int? stumped,
  }) {
    emit(
      state.copyWith(
        totalRuns: totalRuns,
        highestIndScore: highestIndScore,
        dots: dots,
        ones: ones,
        twos: twos,
        fours: fours,
        sixes: sixes,
        totalExtras: totalExtras,
        wides: wides,
        noBalls: noBalls,
        legBies: legBies,
        totalWickets: totalWickets,
        caught: caught,
        bowled: bowled,
        lbws: lbws,
        runOuts: runOuts,
      ),
    );
  }
}
