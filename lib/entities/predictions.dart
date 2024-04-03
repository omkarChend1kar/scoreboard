import 'package:equatable/equatable.dart';
import 'package:scoreboard/widgets/score_input_widget.dart';

class Predictions extends Equatable {
  final int? totalExtras;
  final int? wides;
  final int? noBalls;
  final int? legBies;
  final int? totalRuns;
  final int? highestIndScore;
  final int? dots;
  final int? ones;
  final int? twos;
  final int? fours;
  final int? sixes;
  final int? totalWickets;
  final int? caught;
  final int? bowled;
  final int? lbws;
  final int? runOuts;
  final int? stumped;

  const Predictions({
    this.totalExtras,
    this.wides,
    this.noBalls,
    this.legBies,
    this.totalRuns,
    this.highestIndScore,
    this.dots,
    this.ones,
    this.twos,
    this.fours,
    this.sixes,
    this.totalWickets,
    this.caught,
    this.bowled,
    this.lbws,
    this.runOuts,
    this.stumped,
  });

  int getTotalSelections() {
    int count = 0;
    for (var value in props) {
      if (value != null) {
        count++;
      }
    }
    return count;
  }

  List<Map<String, dynamic>> getSelectedPredictions() {
    final List<Map<String, dynamic>> selectedPredictions = [];
    if (totalExtras != null) {
      selectedPredictions
          .add({'catName': 'Total Extras', 'catValue': totalExtras});
    }
    if (wides != null) {
      selectedPredictions.add({'catName': 'Wides', 'catValue': wides});
    }
    if (noBalls != null) {
      selectedPredictions.add({'catName': 'No Balls', 'catValue': noBalls});
    }
    if (legBies != null) {
      selectedPredictions.add({'catName': 'L.B.', 'catValue': legBies});
    }
    if (totalRuns != null) {
      selectedPredictions.add({'catName': 'Total Runs', 'catValue': totalRuns});
    }
    if (highestIndScore != null) {
      selectedPredictions
          .add({'catName': 'H.I.S', 'catValue': highestIndScore});
    }
    if (dots != null) {
      selectedPredictions.add({'catName': 'Dots', 'catValue': dots});
    }
    if (ones != null) {
      selectedPredictions.add({'catName': '1\'s', 'catValue': ones});
    }
    if (twos != null) {
      selectedPredictions.add({'catName': '2\'s', 'catValue': twos});
    }
    if (fours != null) {
      selectedPredictions.add({'catName': '4\'s', 'catValue': fours});
    }
    if (sixes != null) {
      selectedPredictions.add({'catName': '6\'s', 'catValue': sixes});
    }
    if (totalWickets != null) {
      selectedPredictions
          .add({'catName': 'Total Wickets', 'catValue': totalWickets});
    }
    if (caught != null) {
      selectedPredictions.add({'catName': 'Caught', 'catValue': caught});
    }
    if (bowled != null) {
      selectedPredictions.add({'catName': 'Bowled', 'catValue': bowled});
    }
    if (lbws != null) {
      selectedPredictions.add({'catName': 'L.B.W.', 'catValue': lbws});
    }
    if (runOuts != null) {
      selectedPredictions.add({'catName': 'Run Out', 'catValue': runOuts});
    }
    if (stumped != null) {
      selectedPredictions.add({'catName': 'Stumped', 'catValue': stumped});
    }
    return selectedPredictions;
  }

  int? getFieldByCategory(PredictionCategory category) {
    switch (category) {
      case PredictionCategory.totalExtras:
        return totalExtras;
      case PredictionCategory.wides:
        return wides;
      case PredictionCategory.noBalls:
        return noBalls;
      case PredictionCategory.legBies:
        return legBies;
      case PredictionCategory.totalRuns:
        return totalRuns;
      case PredictionCategory.highestIndScore:
        return highestIndScore;
      case PredictionCategory.dots:
        return dots;
      case PredictionCategory.ones:
        return ones;
      case PredictionCategory.twos:
        return twos;
      case PredictionCategory.fours:
        return fours;
      case PredictionCategory.sixes:
        return sixes;
      case PredictionCategory.totalWickets:
        return totalWickets;
      case PredictionCategory.caught:
        return caught;
      case PredictionCategory.bowled:
        return bowled;
      case PredictionCategory.lbws:
        return lbws;
      case PredictionCategory.runOuts:
        return runOuts;
      case PredictionCategory.stumped:
        return stumped;
    }
  }

  Predictions copyWith({
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
    return Predictions(
      totalRuns: totalRuns ?? this.totalRuns,
      highestIndScore: highestIndScore ?? this.highestIndScore,
      dots: dots ?? this.dots,
      ones: ones ?? this.ones,
      twos: twos ?? this.twos,
      fours: fours ?? this.fours,
      sixes: sixes ?? this.sixes,
      totalExtras: totalExtras ?? this.totalExtras,
      wides: wides ?? this.wides,
      noBalls: noBalls ?? this.noBalls,
      legBies: legBies ?? this.legBies,
      totalWickets: totalWickets ?? this.totalWickets,
      caught: caught ?? this.caught,
      bowled: bowled ?? this.bowled,
      lbws: lbws ?? this.lbws,
      runOuts: runOuts ?? this.runOuts,
      stumped: stumped ?? this.stumped,
    );
  }

  @override
  List<int?> get props => [
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
        caught,
        bowled,
        lbws,
        runOuts,
        stumped
      ];
}
