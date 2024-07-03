import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_app/screens/bit_coin_screen.dart';

import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/counter_screen.dart';
import 'package:food_app/screens/newmeal_screen.dart';
import 'package:food_app/screens/tabs_screen.dart';
import 'package:food_app/screens/to_do_screen.dart';

import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(ProviderScope(child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 131, 57, 0)),
    textTheme: GoogleFonts.latoTextTheme(),
),
      home:TodoScreen(),
    );
  }
}