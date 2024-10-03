import 'package:aura/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(Aura());

class Aura extends StatelessWidget {
  const Aura({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D101F),
          secondary: const Color(0xFF7881AF),
        ),
        scaffoldBackgroundColor: const Color(0xFF668EA3),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
            padding: WidgetStateProperty.all(const EdgeInsets.all(9)),
            elevation: WidgetStateProperty.all(5),
            iconSize: WidgetStateProperty.all(5),
          ),
        ),

        // Customizing the AppBar
        appBarTheme: const AppBarTheme(
          elevation: 9.0,
          backgroundColor: Color(0xFF668EA3),
          titleTextStyle: TextStyle(
            fontSize: 23,
            color: Color(0xFF043473),
            fontFamily: 'Ubuntu',
          ),
        ),

        // Customizing input fields
      ),
      home: LoadingScreen(),
    );
  }
}
