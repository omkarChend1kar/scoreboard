import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/entities/predictions.dart';
import 'package:scoreboard/states/cubit/scoreboard_cubit.dart';
import 'package:scoreboard/widgets/skewed_progress_indicator.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;

  final double toolBarBottomHeight; // Optional list of actions

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    required this.toolBarBottomHeight,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + toolBarBottomHeight); // Increased height

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),

      leading: Padding(
        padding: const EdgeInsets.only(left: 13.0),
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      leadingWidth: 40,
      actions: actions,
      // backgroundColor: Colors.teal, // Custom color
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 110),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image.asset(
                    'assets/images/aus.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),
                const Text('LUC VS PUNJK'),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Image.asset(
                    'assets/images/aus.png',
                    width: 60,
                    height: 60,
                    fit: BoxFit.fill,
                  ),
                ),

                // Image.asset(
                //   'assets/images/ind.png',
                // ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selections',
                          style: textTheme.bodyMedium,
                        ),
                        BlocBuilder<ScoreboardCubit, Predictions>(
                          builder: (context, state) {
                            int selectedNum = state.getTotalSelections();
                            return RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: selectedNum.toString(),
                                    style: textTheme.bodyLarge!
                                        .copyWith(fontSize: 18),
                                  ),
                                  TextSpan(
                                    text: '/12',
                                    style: textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                        // const Text(
                        //   '0/12',
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  BlocBuilder<ScoreboardCubit, Predictions>(
                    builder: (context, state) {
                      int selectedNum = state.getTotalSelections();
                      return SkewedProgressIndicator(
                        selectedIndex: selectedNum,
                        totalItems: 12,
                      );
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_circle_outline,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
