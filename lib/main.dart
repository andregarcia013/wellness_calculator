import 'package:andregarcia_kalshi/core/di.dart';
import 'package:andregarcia_kalshi/core/router.dart';
import 'package:andregarcia_kalshi/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.dark,
        ),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => blueColor))),
        inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: blueColor,
                  width: 1,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: inputGrey,
                  width: 1,
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: inputGrey,
                  width: 1,
                ))),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.workSans(
              fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.w600),
          titleMedium: GoogleFonts.workSans(
            fontSize: 14.0,
            color: const Color(0xFF708797),
          ),
          headlineLarge: GoogleFonts.workSans(fontSize: 18.0, color: blueColor),
          labelMedium: GoogleFonts.rubik(color: darkerFont, fontSize: 24),
          bodyMedium: GoogleFonts.workSans(color: Colors.black, fontSize: 14.0),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
    );
  }
}
