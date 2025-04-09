import 'package:flutter/material.dart';
import 'package:puzzle_game/provider/grid_provider.dart';
import 'package:puzzle_game/screens/grid_display_screen.dart';
import 'package:puzzle_game/screens/spalash_screen.dart';
import 'screens/input_screen.dart';
import 'screens/grid_input_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GridProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Word Search Grid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/input': (context) => const InputScreen(),
        '/gridInput': (context) => const GridInputScreen(),
        '/gridDisplay': (context) => const GridDisplayScreen(),
      },
    );
  }
}
