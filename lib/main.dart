import 'package:flutter/material.dart';
import 'package:furnishop/main_home_page.dart';
import 'package:furnishop/screens/details_sreen.dart';
import 'package:furnishop/screens/explore_screen.dart';
import 'package:furnishop/screens/payment_screen.dart';
import 'package:furnishop/screens/user_screen.dart';
import 'package:furnishop/screens/wishlist_screen.dart';

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
        WishlistScreen.routeName: (context) => WishlistScreen(),
        UsersScreen.routeName: (context) => const UsersScreen(),
        PaymentScreen.routeName: (context) => const PaymentScreen(),
        DetailsProduct.routeName: (context) => const DetailsProduct(),
      },
    );
  }
}
