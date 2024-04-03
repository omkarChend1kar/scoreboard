import 'package:flutter/material.dart';
import 'package:scoreboard/pages/scoreboard_preview_page.dart';
import 'package:scoreboard/widgets/custom_app_bar.dart';
import 'package:scoreboard/widgets/extras_predictions_widget.dart';
import 'package:scoreboard/widgets/runs_predictions_widget.dart';
import 'package:scoreboard/widgets/wickets_predictions_widget.dart';

class ScoreboardPage extends StatefulWidget {
  const ScoreboardPage({super.key});

  @override
  State<ScoreboardPage> createState() => _ScoreboardPageState();
}

class _ScoreboardPageState extends State<ScoreboardPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _controller;
  final ValueNotifier<int> currentTabIndex = ValueNotifier<int>(0);

  final TextEditingController totalRunsController = TextEditingController();
  final TextEditingController highestIndScoreController =
      TextEditingController();
  final TextEditingController dotsController = TextEditingController();
  final TextEditingController onesController = TextEditingController();
  final TextEditingController twosController = TextEditingController();
  final TextEditingController foursController = TextEditingController();
  final TextEditingController sixesController = TextEditingController();
  final TextEditingController totalWicketsController = TextEditingController();
  final TextEditingController caughtController = TextEditingController();
  final TextEditingController bowledController = TextEditingController();
  final TextEditingController lbwController = TextEditingController();
  final TextEditingController runOutController = TextEditingController();
  final TextEditingController stampedController = TextEditingController();
  final TextEditingController totalExtrasController = TextEditingController();
  final TextEditingController widesController = TextEditingController();
  final TextEditingController noBallController = TextEditingController();
  final TextEditingController legByController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
    _controller.addListener(() {
      currentTabIndex.value = _controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    const List<Tab> myTabs = <Tab>[
      Tab(text: 'RUNS'),
      Tab(text: 'WICKETS'),
      Tab(text: 'EXTRAS'),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        toolBarBottomHeight: screenHeight * 0.15,
        title: "Scoreboard 1",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.help_outline,
            ),
          ),
        ],
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(color: colorScheme.onPrimary),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  TabBar(
                    controller: _controller,
                    tabs: myTabs,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 25,
                      ),
                      child: TabBarView(
                        controller: _controller,
                        children: [
                          RunsPredictionsWidget(
                            dotsController: dotsController,
                            foursController: foursController,
                            onesController: onesController,
                            sixesController: sixesController,
                            totalRunsController: totalRunsController,
                            twosController: twosController,
                          ),
                          WicketsPredictionWidget(
                            bowledController: bowledController,
                            caughtController: caughtController,
                            lbwController: lbwController,
                            runOutController: runOutController,
                            stampedController: stampedController,
                            totalWicketsController: totalWicketsController,
                          ),
                          ExtrasPredictionsWidget(
                            legByController: lbwController,
                            noBallController: noBallController,
                            totalExtrasController: totalExtrasController,
                            widesController: widesController,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ScoreboardPreviewPage(),
                        ),
                      ),
                      child: Text(
                        'Preview',
                        style: textTheme.bodyMedium!.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Next',
                        style: textTheme.bodyMedium!
                            .copyWith(color: colorScheme.secondary),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
