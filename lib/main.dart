import 'package:flutter/material.dart';
import 'package:mercadinho_jamp/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Colors.red,
          onPrimary: Colors.white,
          secondary: Colors.red,
          onSecondary: Colors.black,
          tertiary: Colors.lightGreen.shade100,
          onTertiary: Colors.black,
          surfaceBright: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}