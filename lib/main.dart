import 'package:flutter/material.dart';
import 'package:furnishop/main_home_page.dart';
import 'package:furnishop/screens/explore_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MainHomePage(),
        ExploreScreen.routeName: (context) => const ExploreScreen(),
      },
    );
  }
}
