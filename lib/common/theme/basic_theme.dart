import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Basic Theme for the application
ThemeData basicTheme() {
  TextTheme _basicTextTheme(TextTheme base) {
    return GoogleFonts.lexendTextTheme(base).copyWith(
      displayLarge: GoogleFonts.lexend(
        textStyle: base.displayLarge!.copyWith(
          fontSize: 57.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      displayMedium: GoogleFonts.lexend(
        textStyle: base.displayMedium!.copyWith(
          fontSize: 45.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      displaySmall: GoogleFonts.lexend(
        textStyle: base.displaySmall!.copyWith(
          fontSize: 36.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      headlineLarge: GoogleFonts.lexend(
        textStyle: base.headlineLarge!.copyWith(
          fontSize: 32.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      headlineMedium: GoogleFonts.lexend(
        textStyle: base.headlineMedium!.copyWith(
          fontSize: 28.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      headlineSmall: GoogleFonts.lexend(
        textStyle: base.headlineSmall!.copyWith(
          fontSize: 24.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      titleLarge: GoogleFonts.lexend(
        textStyle: base.titleLarge!.copyWith(
          fontSize: 22.0,
          color: const Color.fromARGB(255, 227, 227, 227),
          fontWeight: FontWeight.normal,
        ),
      ),
      titleMedium: GoogleFonts.lexend(
        textStyle: base.titleMedium!.copyWith(
          fontSize: 16.0,
          color: const Color.fromARGB(255, 227, 227, 227),
          fontWeight: FontWeight.normal,
          letterSpacing: 0.15,
        ),
      ),
      titleSmall: GoogleFonts.lexend(
        textStyle: base.titleSmall!.copyWith(
          fontSize: 12.0,
          color: const Color.fromARGB(255, 227, 227, 227),
          fontWeight: FontWeight.normal,
          letterSpacing: 0.1,
        ),
      ),
      labelLarge: GoogleFonts.lexend(
        textStyle: base.labelLarge!.copyWith(
          fontSize: 14.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.1,
        ),
      ),
      labelMedium: GoogleFonts.lexend(
        textStyle: base.labelMedium!.copyWith(
          fontSize: 12.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
        ),
      ),
      labelSmall: GoogleFonts.lexend(
        textStyle: base.labelSmall!.copyWith(
          fontSize: 11.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.5,
        ),
      ),
      bodyLarge: GoogleFonts.lexend(
        textStyle: base.bodyLarge!.copyWith(
          fontSize: 16.0,
          color: Colors.white,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.15,
        ),
      ),
      bodyMedium: GoogleFonts.lexend(
        textStyle: base.bodyMedium!.copyWith(
          fontSize: 14.0,
          color: const Color.fromARGB(255, 186, 186, 186),
          fontWeight: FontWeight.normal,
          letterSpacing: 0.25,
        ),
      ),
      bodySmall: GoogleFonts.lexend(
        textStyle: base.bodySmall!.copyWith(
          fontSize: 12.0,
          color: Colors.black,
          fontWeight: FontWeight.normal,
          letterSpacing: 0.4,
        ),
      ),
    );
  }

  ///
  final ColorScheme colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: const Color.fromARGB(255, 240, 192, 66),
    onPrimary: const Color.fromARGB(255, 10, 86, 96),
    onSecondary: const Color.fromARGB(255, 240, 192, 66),
    secondary: const Color.fromARGB(255, 12, 57, 63),
    error: Colors.red,
    onError: Colors.red,
    tertiary: const Color.fromARGB(255, 4, 156, 161),
    onTertiary: Colors.grey.shade200,
    background: Colors.grey.shade300,
    onBackground: Colors.blue.shade100,
    surface: const Color.fromARGB(255, 4, 156, 161),
    onSurface: Colors.black,
  );

  ///base theme as light theme
  final ThemeData base = ThemeData.light();

  //return primary theme data
  return ThemeData(
    //Giving colorscheme to themeData here
    //To access all predefined colors through Theme.of(context).colorScheme
    textTheme: _basicTextTheme(base.textTheme),
    iconTheme: IconThemeData(color: colorScheme.onSecondary),
    inputDecorationTheme: const InputDecorationTheme(
      errorStyle: TextStyle(),
      fillColor: Colors.white,
      hintStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xffF2F2F7),
    secondaryHeaderColor: Colors.black,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(colorScheme.secondary),
        backgroundColor: MaterialStateProperty.all(
          colorScheme.secondary.withOpacity(0.2),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.secondary,
      centerTitle: false,
      iconTheme: IconThemeData(color: colorScheme.onSecondary),
      titleTextStyle: const TextStyle(
          fontFamily: "Lexend",
          fontSize: 18.0,
          // color: crayola,
          fontWeight: FontWeight.bold),
      toolbarTextStyle: const TextStyle(
        fontFamily: "Lexend",
        fontSize: 18.0,
        // color: crayola,
        fontWeight: FontWeight.bold,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      overlayColor: MaterialStateProperty.all(
        colorScheme.primary.withOpacity(
          0.3,
        ),
      ),
      labelStyle: _basicTextTheme(base.textTheme).labelLarge!.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
      unselectedLabelColor: colorScheme.primary,
      unselectedLabelStyle:
          _basicTextTheme(base.textTheme).labelLarge!.copyWith(
                color: colorScheme.primary,
              ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        side: MaterialStateProperty.all(
          BorderSide(
            width: 1,
            color: colorScheme.primary,
          ),
        ),
        overlayColor:
            MaterialStateProperty.all(colorScheme.onSecondary.withOpacity(0.1)),
        foregroundColor: MaterialStateProperty.all(colorScheme.primary),
        backgroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
        minimumSize: MaterialStateProperty.all<Size>(const Size(150, 40)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(
              width: 10,
              color: colorScheme.primary,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    ),
    dividerColor: Colors.transparent,
    
    dataTableTheme: DataTableThemeData(
      columnSpacing: 30,
      dataRowColor: MaterialStateProperty.all(Colors.transparent),
      
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
        overlayColor:
            MaterialStateProperty.all(colorScheme.surface.withOpacity(0.1)),
        foregroundColor: MaterialStateProperty.all(colorScheme.onSecondary),
        backgroundColor: MaterialStateProperty.all(colorScheme.primary),
        minimumSize: MaterialStateProperty.all<Size>(
          const Size(
            double.maxFinite,
            45,
          ),
        ),
        // shadowColor: MaterialStateProperty.all(colorScheme.background),
        elevation: MaterialStateProperty.all<double>(0),
      ),
    ),
    colorScheme: colorScheme,
  );
}
