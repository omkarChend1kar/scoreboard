import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard/common/theme/basic_theme.dart';
import 'package:scoreboard/pages/scoreboard_page.dart';
import 'package:scoreboard/states/cubit/scoreboard_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScoreboardCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: basicTheme(),
        home: const ScoreboardPage(),
      ),
    );
  }
}




